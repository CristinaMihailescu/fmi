Visual Studio 2015

Fle -> New -> Web Site -> C# -> ASP.NET empty

Pentru fiecare cheie primara: Properties (dreapta jos) -> identity specification -> IsIdentity set to true

Cerinta: IDOras - int - id oras dim care face parte anuntul (cheie externa). In tabelul Anunturi: click pe idoras -> (dreapta) foreign keys -> add -> enter. Source -> modifica column (cu idoras) si table (cu Oras - numele celuilalt tabel din care e cheia externa).

Dublu click pe database.mdf -> copy connection string (dreapta jos) -> paste la <asp:SqlDataSource ... ConnectionString="...**aici**..."


Tools -> Options -> All Languages -> General -> Word wrap -> enable Show visual glyphs for word wrap
