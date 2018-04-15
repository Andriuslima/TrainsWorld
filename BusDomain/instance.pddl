(define (problem busproblem)
(:domain bus)
(:objects
    b1 b2 b3 b4
    s0 s1 s2 s3 s4 s5 s6
    cidadao
)

(:init

(person cidadao)

(bus b1)
(bus b2)
(bus b3)
(bus b4)

(stop s0)
(stop s1)
(stop s2)
(stop s3)
(stop s4)
(stop s5)
(stop s6)

(road s0 s1) (road s1 s0)
(road s1 s2) (road s2 s1)
(road s1 s3) (road s3 s1)
(road s1 s4) (road s4 s1)
(road s2 s6) (road s6 s1)
(road s3 s5) (road s5 s3)


(itinerary b1 s0 s1)
(itinerary b1 s1 s4)
(itinerary b2 s1 s2)
(itinerary b3 s1 s3)
(itinerary b3 s3 s5)
(itinerary b4 s2 s6)

(at cidadao s0)



)
(:goal (and
<HYPOTHESIS>
))
)
