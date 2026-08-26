import "package:flutter/material.dart";

class TmdbSearchBar extends StatelessWidget
{

    @override
    Widget build(BuildContext context)
    {
        return SearchAnchor 
        (
            builder: (BuildContext context, SearchController controller)
            {
                return SearchBar
                (
                    controller: controller,
                    onTap: ()
                    {
                        controller.openView();
                    },
                    onChanged: (_)
                    {
                        controller.openView();
                    },
                    leading: Icon(Icons.search),

                );
            }
            suggestionsBuilder:(){}, 
        );
    }
}
