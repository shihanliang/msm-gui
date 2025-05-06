Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  

# Directors
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/eldest", { :controller => "directors", :action => "eldest" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest" })
  get("/directors/:the_id", { :controller => "directors", :action => "show" })
  post("/create_director", { :controller => "directors", :action => "create" })
  post("/update_director/:the_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:the_id", { :controller => "directors", :action => "destroy" })

# Movies

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:the_id", { :controller => "movies", :action => "show" })
  post("/create_movie", { :controller => "movies", :action => "create" })
  post("/update_movie/:the_id", { :controller => "movies", :action => "update" })
  get("/delete_movie/:the_id", { :controller => "movies", :action => "destroy" })

# Actors
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", { :controller => "actors", :action => "create" })
  post("/update_actor/:path_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "destroy" })

end
