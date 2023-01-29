# Season
- name:string

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

# Season::Suggestion
- season:references
- user:references
- movie:references
- was_picked:boolean{default: false}
=> unique (season:movie)
