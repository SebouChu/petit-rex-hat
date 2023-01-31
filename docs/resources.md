# Season
- name:string
- status:integer (upcoming, ongoing, ended)

# User
- devise stuff

# Movie
- title:string
- title_fr:string
- director:string
- release_date:date
- poster:attachment
- backdrop:attachment
- tmdb_identifier:bigint

# Suggestion
- season:references
- user:references
- movie:references
- picked_at:datetime
=> unique (season:movie)
