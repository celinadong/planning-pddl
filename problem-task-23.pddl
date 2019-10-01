(define (problem waiting-23) ;; Replace XX with task number
    (:domain waiting)
    (:objects
        P1 - plate
        P2 - plate
        C1 - customer
        C2 - customer
        BUFF - location
        UB - location
        UF - location
        MB - location
        MF - location
        LB - location
        LF - location
    )
    
    (:init
        (At Agent MF)
        (At P1 MB)
        (not (HasFood P1))
        (At P2 LB)
        (not (HasFood P2))
        (At C1 UB)
        (not (Served C1))
        (At C2 LF)
        (not (Served C2))
        (EmptyHanded Agent)
        (Adjacent BUFF UF)
        (Adjacent UF BUFF)
        (Adjacent UF UB)
        (Adjacent UB UF)
        (Adjacent UB MB)
        (Adjacent MB UB)
        (Adjacent MB LB)
        (Adjacent LB MB)
        (Adjacent LB LF)
        (Adjacent LF LB)
        (Adjacent UF MF)
        (Adjacent MF UF)
        (Adjacent MF LF)
        (Adjacent LF MF)

    )
    
    (:goal (and 
        (Served C1)
        (Served C2)
        (At Agent BUFF)
    ))
)
