package cwitter


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def register()
    {

        User userInstance = new User()
        userInstance.lastname= params.lastname
        userInstance.firstname= params.firstname
        userInstance.username= params.username
        userInstance.email= params.email
        userInstance.password= params.password

        userInstance.save(flush: true)


        session.id = userInstance.id
        println "userinstqnce = " + userInstance.toString()

        redirect(controller: 'user', action: 'acceuil', id: userInstance.id)

    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }


    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }
    def login()
    {
        redirect(uri: "/user/login.gsp")
    }

    def checkUser()
    {
        if(!session.user)
        {
            redirect(action: 'login')
        }
    }


    def authentification()
    {
        User user = User.findByUsernameAndPassword(params.username, params.password)
        if(user)
        {
            session.user = user
            session.connecte = "OK"
            flash.message = "Hello ${user.username}!"
            redirect(controller: "user", action: "acceuil", id: user.id)
        }else
        {
            redirect(uri: "/user/login.gsp")
        }

    }

    def logout ()
            {
                flash.message = "Goodbye ${session.user.name}"
                session.user = null
                session.connecte = null
                redirect(controller:"user", action:"list")
            }

    def acceuil()
    {

    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def rechercher()
    {
        def userRecherche
        def test = User.findByUsername(params.rechercher)
        println 'test = ' + test.toString() + ' params ' + params.rechercher
        if(test != null)
        {
            userRecherche = User.findByUsername(params.rechercher)
        }else
        {
            userRecherche = message(code: 'default.recherche.testVide', default: 'Les critères de votre recherche n\'ont rien trouvé')
        }

       redirect(controller: 'user', action: 'show', id: userRecherche.id)
    }



}
