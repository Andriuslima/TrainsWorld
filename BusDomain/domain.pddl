(define (domain bus)
    (:requirements :strips :typing :equality)
    (:predicates 
        (road ?from ?to )
        (bus ?bus)
        (stop ?stop)
        (at ?person ?place)
        (traveling ?person ?bus)
        (itinerary ?bus ?from ?to)
        (person ?person)
    )

    (:action board
        :parameters (?person ?bus ?stop)
        :precondition (and
            (bus ?bus)
            (stop ?stop)
            (person ?person)
            (at ?person ?stop)
           )
        :effect (and
            (traveling ?person ?bus)
            (not (at ?person ?stop))
        )
    )

    (:action travel
        :parameters (?person ?bus ?from ?to)
        :precondition (and 
            (bus ?bus)
            (stop ?to)
            (stop ?from)
            (person ?person)
            (road ?from ?to)
            (itinerary ?bus ?from ?to)
            (traveling ?person ?bus)
        )
        :effect (and
            (at ?person ?to)
            (not (at ?person ?from))
        )
    )
    
    (:action leave
        :parameters (?person ?bus ?stop)
        :precondition (and
            (bus ?bus)
            (stop ?stop)
            (person ?person)
            (at ?person ?stop)
            (traveling ?person ?bus)         
        )
        :effect (and
            (not (traveling ?person ?bus))
        )
    )
    
    
)
