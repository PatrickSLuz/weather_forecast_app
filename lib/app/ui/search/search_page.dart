import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/shared/helpers/debouncer.dart';
import 'package:weather_forecast_app/app/shared/routes/app_routes.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';
import 'package:weather_forecast_app/app/ui/search/widgets/city_tile_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _debouncer = Debouncer();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => _focusNode.requestFocus(),
      );
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onCityTilePressed(CityModel city) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, city);
      return;
    }
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.weatherPage,
      (route) => false,
      arguments: city,
    );
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
              onPressed: () async {
                await Future.delayed(
                  const Duration(milliseconds: 100),
                  () => Navigator.pop(context),
                );
              },
              icon: const Icon(Icons.close_rounded),
            ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
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

          if (state is SearchSuccessState) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                return CityTileWidget(
                  city: state.cities[index],
                  onTap: () => onCityTilePressed(state.cities[index]),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
