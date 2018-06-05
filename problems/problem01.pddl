(define (problem PROBLEM_ONE) (:domain TRAINS)
(:objects
    holmes - person
    L1 L2 L3 - line
    S10 S11 S12 S13 S14 S15 - stop
    S20 S21 S22 S23 S24 - stop
    S30 S31 S32 S33 S34 S35 S36 S37 S38 S39 - stop
    I1 I2 I3 - stop
)

(:init
    (at holmes S10)

    (itinerary L1 S10)
    (itinerary L1 S11)
    (itinerary L1 S12)
    (itinerary L1 I1)
    (itinerary L1 S13)
    (itinerary L1 S14)
    (itinerary L1 I2)
    (itinerary L1 S15)

    (itinerary L2 S20)
    (itinerary L2 S21)
    (itinerary L2 S22)
    (itinerary L2 I1)
    (itinerary L2 S23)
    (itinerary L2 S24)
    (itinerary L2 I3)

    (itinerary L3 S30)
    (itinerary L3 S31)
    (itinerary L3 S32)
    (itinerary L3 S33)
    (itinerary L3 I2)
    (itinerary L3 S34)
    (itinerary L3 S35)
    (itinerary L3 S36)
    (itinerary L3 S37)
    (itinerary L3 S38)
    (itinerary L3 S39)
    (itinerary L3 I3)
)

(:goal (and
    (at holmes S30)
    (not (on-train holmes))
)
)
)
