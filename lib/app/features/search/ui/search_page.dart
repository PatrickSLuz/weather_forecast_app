import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/features/search/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/core/helpers/debouncer.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/design_system/dialogs/app_information_dialog.dart';
import 'package:weather_forecast_app/app/features/search/ui/widgets/city_tile_widget.dart';
import 'package:weather_forecast_app/design_system/dialogs/app_confirmation_dialog.dart';
import 'package:weather_forecast_app/app/features/search/ui/widgets/use_my_location_tile_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCubit searchCubit;
  late bool canUseLocation;

  final _debouncer = Debouncer();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchCubit = context.read<SearchCubit>();
    searchCubit.canUse().then(
          (value) => canUseLocation = value,
        );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onUseMyLocationTap() async {
    final navigator = Navigator.of(context);

    final location = await searchCubit.getLocation();
    if (location == null) return;

    if (navigator.canPop()) {
      return navigator.pop(
        CityModel.coordinate(
          lat: location.latitude,
          lng: location.longitude,
        ),
      );
    }

    navigator.pushNamedAndRemoveUntil(
      AppRoutes.weatherPage,
      (route) => false,
      arguments: {
        'lat': location.latitude,
        'lng': location.longitude,
      },
    );
  }

  void onCityTileTap(CityModel city) {
    searchCubit.saveCity(city);

    if (Navigator.canPop(context)) {
      return Navigator.pop(context, city);
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.weatherPage,
      (route) => false,
      arguments: {
        'lat': city.lat,
        'lng': city.lng,
      },
    );
  }

  void onCityTileLongPress(CityModel city) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AppConfirmationDialog(
        title: 'Remover cidade??',
        description: '${city.name} será removida do seu histórico de pesquisa.',
      ),
    );

    if (result != null && result) {
      searchCubit.deleteCity(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: Navigator.canPop(context)
              ? const EdgeInsets.only(left: 8)
              : EdgeInsets.zero,
          child: TextFormField(
            focusNode: _focusNode,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]')),
            ],
            decoration: const InputDecoration(
              hintText: 'Pesquise uma cidade',
              prefixIcon: Icon(Icons.search_rounded),
              prefixIconColor: AppColors.darkBlue,
            ),
            onChanged: (value) {
              final searchCubit = context.read<SearchCubit>();
              _debouncer.run(() => searchCubit.searchCity(value));
            },
            onFieldSubmitted: (value) {
              final searchCubit = context.read<SearchCubit>();
              searchCubit.searchCity(value);
            },
          ),
        ),
        actions: [
          if (Navigator.canPop(context))
            IconButton(
              tooltip: 'Pesquisar',
              onPressed: () async {
                final navigator = Navigator.of(context);
                await Future.delayed(
                  const Duration(milliseconds: 100),
                  navigator.pop,
                );
              },
              icon: const Icon(Icons.close_rounded),
            ),
        ],
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: _listener,
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (state is SearchSuccessState || state is SavedCitiesLoadedState) {
            List<CityModel> cities = [];
            if (state is SearchSuccessState) cities = state.cities;
            if (state is SavedCitiesLoadedState) cities = state.savedCities;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                if (state is SavedCitiesLoadedState && canUseLocation)
                  UseMyLocationTileWidget(
                    onTap: onUseMyLocationTap,
                  ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return CityTileWidget(
                      city: cities[index],
                      onTap: () => onCityTileTap(cities[index]),
                      onLongPress: state is SavedCitiesLoadedState
                          ? () => onCityTileLongPress(cities[index])
                          : null,
                      icon: state is SearchSuccessState
                          ? Icons.location_on_rounded
                          : Icons.history_rounded,
                    );
                  },
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _listener(context, state) {
    if (state is SavedCitiesLoadedState) {
      if (state.savedCities.isEmpty) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => _focusNode.requestFocus(),
        );
      }
    } else if (state is GetLocationErrorState) {
      showDialog<bool>(
        context: context,
        builder: (_) => const AppInformationDialog(
          title: 'Opss!',
          description:
              'Não foi possível buscar sua localização. Por favor, tente novamente!',
        ),
      );
    }
  }
}
