(define (problem waiting-22) ;; Replace XX with task number
    (:domain waiting)
    (:objects
        P - plate
        C - customer
        BUFF - location
        UB - location
        UF - location
        MB - location
        MF - location
        LB - location
        LF - location
    )
    
    (:init
        (At Agent BUFF)
        (At P BUFF)
        (not (HasFood P))
        (At C LB)
        (not (Served C))
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
        (Served C)
    ))
)
