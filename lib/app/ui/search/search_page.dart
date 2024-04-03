import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/app/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/ui/search/widgets/city_tile_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              hintText: 'Pesquise uma cidade',
            ),
            onFieldSubmitted: (value) {
              final searchCubit = context.read<SearchCubit>();
              searchCubit.searchCity(value);
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
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
                return CityTileWidget(city: state.cities[index]);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
