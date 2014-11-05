package cwitter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CweetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cweet.list(params), model:[cweetInstanceCount: Cweet.count()]
    }

    def show(Cweet cweetInstance) {
        respond cweetInstance
    }

    def create() {
        respond new Cweet(params)
    }

    @Transactional
    def save(Cweet cweetInstance) {
        if (cweetInstance == null) {
            notFound()
            return
        }

        if (cweetInstance.hasErrors()) {
            respond cweetInstance.errors, view:'create'
            return
        }

        cweetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cweet.label', default: 'Cweet'), cweetInstance.id])
                redirect cweetInstance
            }
            '*' { respond cweetInstance, [status: CREATED] }
        }
    }

    def edit(Cweet cweetInstance) {
        respond cweetInstance
    }

    @Transactional
    def update(Cweet cweetInstance) {
        if (cweetInstance == null) {
            notFound()
            return
        }

        if (cweetInstance.hasErrors()) {
            respond cweetInstance.errors, view:'edit'
            return
        }

        cweetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cweet.label', default: 'Cweet'), cweetInstance.id])
                redirect cweetInstance
            }
            '*'{ respond cweetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cweet cweetInstance) {

        if (cweetInstance == null) {
            notFound()
            return
        }

        cweetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cweet.label', default: 'Cweet'), cweetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cweet.label', default: 'Cweet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}