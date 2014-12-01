class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"                     (controller: 'user',action: 'acceuil')
        "/user"                 (controller: 'user',action: 'acceuil')
        "/groupe"               (controller: 'groupe', action: 'index')
        "500"(view:'/error')
	}
}
