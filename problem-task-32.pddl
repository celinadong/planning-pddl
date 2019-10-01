(define (problem waiting-32) ;; Replace XX with task number
    (:domain waiting)
    (:objects
        C - customer
        P - plate
        BP1 - brokenPlate
        BP2 - brokenPlate
        DF - droppedFood
        B - broom
        UB - location
        UF - location
        MB - location
        MF - location
        LB - location
        LF - location
    )
    
    (:init
        (Adjacent BUFF UF)
        (Adjacent UF UB)
        (Adjacent UB MB)
        (Adjacent MB LB)
        (Adjacent LB LF)
        (Adjacent UF MF)
        (Adjacent MF LF)
        (At Agent BUFF)
        (At C LB)
        (not (Served C))
        (At P BUFF)
        (not (HasFood P))
        (At B UB)
        (At BP1 MF)
        (At BP2 MB)
        (At DF UF)

    )
    
    (:goal (and 
        (Served C)
        (At Agent BUFF)
        (forall (?x - location) (not (exists (?BP - brokenPlate) (at ?BP ?x))))
        (forall (?x - location) (not (exists (?DF - droppedFood) (at ?DF ?x))))
    ))
)
