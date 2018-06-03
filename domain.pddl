;;;;;;;;;;;;;;;;;;;
;; TRAINS DOMAIN ;;
;;;;;;;;;;;;;;;;;;;


(define (domain TRAINS)

    (:requirements :strips :typing :conditional-effects :negative-preconditions :equality)

    (:types
        person
        stop
        line
    )

    (:predicates
        (at ?p - person ?s - stop)
        (traveling ?p - person ?l - line)
        (itinerary ?l - line ?s - stop)
        (on-train ?p)
    )

    (:action board
        :parameters (?p - person ?s - stop ?l - line )
        :precondition (and
            (not (on-train ?p))
            (at ?p ?s)
            (itinerary ?l ?s)
            (not (traveling ?p ?l))
        )
        :effect (and
            (traveling ?p ?l)
            (on-train ?p)
        )
    )

    (:action travel
        :parameters (?p - person ?from - stop ?to - stop ?l - line  )
        :precondition (and
            (on-train ?p) 
            (traveling ?p ?l)
            (itinerary ?l ?from)
            (itinerary ?l ?to)
            (at ?p ?from)
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )
    
    (:action leave
        :parameters ( ?p - person ?s - stop ?l - line )
        :precondition (and
            (on-train ?p)
            (traveling ?p ?l)
            (at ?p ?s)
        )
        :effect (and 
            (not (traveling ?p ?l))
            (at ?p ?s)
            (not (on-train ?p))
        )
    )
    
    
)
