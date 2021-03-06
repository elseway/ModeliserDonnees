module Premier exposing (Premier, newPremier, versPremier)

type Premier = C Int

newPremier : Int -> Maybe Premier
newPremier x = 
    let l = List.range 2 (x - 1)
    in 
        if (List.length (List.filter (\y ->  (x%y == 0)) l ) == 0) 
        then Just (C x)
        else Nothing
    
versPremier : Premier -> Int 
versPremier (C x) = x


listPremiers : Int -> Int -> List Premier
listPremiers d a = 
    let dI = newPremier d 
    in 
        case dI of
            Just dI ->
                if (d < a ) then dI:: (listPremiers (d + 1) a )
                else
                    if (d == a ) then [dI]
                    else listPremiers a d
            Nothing -> listPremiers (d + 1) a 

testl1 =listPremiers 9 17
