package cwitter


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class GroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model: [groupeInstanceCount: Groupe.count()]
    }

    def show(Groupe groupeInstance) {
        respond groupeInstance
    }

    def create() {
        respond new Groupe(params)
    }

    @Transactional
    def usersAdd()
    {
        Groupe groupeInstance = Groupe.findByNom(params.groupeInstance)
        groupeInstance.users.add(User.findByUsername(params.userDataList))
        def print = groupeInstance.users
        render(template:'userList1', collection:print, var:'users')

    }

    @Transactional
    def save(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view: 'create'
            return
        }
        //Le propriétaire du groupe est l'utilisateur courant
        groupeInstance.owner = User.get(session.user.id)

        println groupeInstance.toString()


        groupeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: CREATED] }
        }
    }

    @Transactional
    def edit(Groupe groupeInstance) {
        respond groupeInstance
    }

    @Transactional
    def follow()
    {

        User user = User.get(session.user.id)
        def groupeInstance = Groupe.get(params.idGroupe)

        groupeInstance.addToUsers(user)
        user.save(flush: true)

        redirect(controller: 'groupe', action: 'index')

    }

    @Transactional
    def unfollow()
    {

        User user = User.get(session.user.id)
        def groupeInstance = Groupe.get(params.idGroupe)

        groupeInstance.removeFromUsers(user)
        user.save(flush: true)

        redirect(controller: 'groupe', action: 'index')

    }


    @Transactional
    def update(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view: 'edit'
            return
        }

        groupeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Groupe groupeInstance) {

        if (groupeInstance == null) {
            notFound()
            return
        }

        groupeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
