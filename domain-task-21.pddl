(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter - object
        location
        ;; Fill in additional types here
        customer - object
        plate - object
        
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (Adjacent ?x - location ?y - location)
        (At ?x - object ?y - location)
        (HasFood ?p - plate)
        (Served ?c - customer)
        (Holding ?a - waiter ?p - plate)
        (EmptyHanded ?a - waiter)
    )
    
    (:action PICKUP
        :parameters (?a - waiter ?p - plate ?x - location)
        :precondition (and 
            (At Agent ?x)
            (At ?p ?x)
            (not (Holding Agent ?p))
            (EmptyHanded Agent)
        )
        :effect (and
            (Holding Agent ?p)
            (not (EmptyHanded Agent))
        )
    )
    
    (:action HANDOVER
        :parameters (?p - plate ?c - customer ?x - location)
        :precondition (and
            (At Agent ?x)
            (At ?c ?x)
            (Holding Agent ?p)
            (HasFood ?p)
            (not (EmptyHanded Agent))
        )
        :effect (and
            (EmptyHanded Agent)
            (Served ?c)
            (not (Holding Agent ?p))
        )
    )
    
    (:action FILLPLATE
        :parameters (?p - plate)
        :precondition (and
            (At Agent BUFF)
            (At ?p BUFF)
            (not (HasFood ?p))
            (Holding Agent ?p)
        )
        :effect (and
            (HasFood ?p)
        )
    )
    
    (:action MOVE
        :parameters (?x - location ?y - location)
        :precondition (and
            (At Agent ?x)
            (Adjacent ?x ?y)
            (not (At Agent ?y))
        )
        :effect (and
            (At Agent ?y)
            (not (At Agent ?x))
            (forall (?p - plate)
                (when (and (Holding Agent ?p))
                      (and (At ?p ?y) (not (At ?p ?x)))
                )
            )
        )
    )
)
