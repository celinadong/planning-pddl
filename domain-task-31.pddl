(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        customer
        plate broom - item
        brokenPlate
        droppedFood

    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (Adjacent ?x - location ?y - location)
        (At ?x - object ?y - location)
        (HasFood ?p - plate)
        (Holding ?a - waiter ?i - item)
        (Served ?c - customer)
    )
    
    (:action PICKUPPLATE
        :parameters (?p - plate ?x - location)
        :precondition (and 
            (At Agent ?x)
            (At ?p ?x)
            (not (exists (?i - item) (Holding Agent ?i)))
        )
        :effect (and
            (Holding Agent ?p)
        )
    )
    
    (:action PICKUPBROOM
        :parameters (?b - broom ?x - location)
        :precondition (and
            (At agent ?x)
            (At ?b ?x)
            (not (exists (?i - item) (Holding Agent ?i)))
        )
        :effect (and
            (Holding Agent ?b)
        )
    )
    
    (:action HANDOVER
        :parameters (?p - plate ?c - customer ?x - location)
        :precondition (and
            (At Agent ?x)
            (At ?c ?x)
            (Holding Agent ?p)
            (HasFood ?p)
        )
        :effect (and
 
            (Served ?c)
            (not (Holding Agent ?p))
        )
    )
    
    (:action FILLPLATE
        :parameters (?p - plate)
        :precondition (and
            (At Agent BUFF)
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
            (not (At Agent ?y))
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (not (exists (?bp - brokenPlate) (At ?bp ?y))) ; Agent cannot move if it contains a broken plate
        )
        :effect (and
            (At Agent ?y)
            (not (At Agent ?x))
        )
    )
    
    (:action SWEEPPLATE
        :parameters (?bp - brokenPlate ?x - location ?y - location)
        :precondition (and
            (At ?bp ?x) ;If the location x has both, robot sweeps it up in one action
            (At Agent ?y)
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (exists (?b - broom) (Holding Agent ?b))
            (not (exists (?p - plate) (Holding Agent ?p)))
        )
        :effect (and
            (not (At ?bp ?x)) 
        )
    )
    
    (:action SWEEPFOOD
        :parameters (?df - droppedFood ?x - location ?y - location)
        :precondition (and
            (At ?df ?x) ;If the location x has both, robot sweeps it up in one action
            (At Agent ?y)
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (exists (?b - broom) (Holding Agent ?b))
            (not (exists (?p - plate) (Holding Agent ?p)))
        )
        :effect (and
            (not (At ?df ?x)) 
        )
    )
    
    (:action PUTDOWN
        :parameters (?i - item ?x - location)
        :precondition (and
            (Holding Agent ?i)
            (At Agent ?x)
        )
        :effect (and
            (not (Holding Agent ?i))
            (At ?i ?x)
        )
    )
    
)
