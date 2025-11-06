------------------- MODULE RemoveSingleInstanceCharacters -------------------

EXTENDS Integers, Sequences, TLC

(*
--algorithm RemoveSingleInstanceCharacters {
    variables antepenultimate, previous, current = "", 
        singleInstance = { "0" }, 
        i = 1,
        input = << >>, result = << >>,
        domainSize \in 1..5,
        domain \in [1..domainSize -> 1..2], 
        characterMapping = << "a", "0" >>;
    
    {
        while(i =< Len(domain)) {
            input := Append(input, characterMapping[domain[i]]);
            i := i + 1;
        };
        
        i := 1;
        
        while(i =< Len(input)) {
            current := input[i];                        
            
            if(~(previous = "")) {
              if(~({ previous } \subseteq singleInstance) \/ ({ current } \subseteq singleInstance)) {
                    result := Append(result, previous);
                };
                else {
                    if({ antepenultimate } \subseteq singleInstance) {
                        result := Append(result, previous);
                    };
                };
            };
            
            antepenultimate := previous;
            previous := current;
            current := "";
            i := i + 1;
        };
        
        if(~(previous = "")) {
          if(~({ previous } \subseteq singleInstance) \/ ({ current } \subseteq singleInstance)) {
                result := Append(result, previous);
            };
            else {
                if({ antepenultimate } \subseteq singleInstance) {
                    result := Append(result, previous);
                };
            };
        };
        
        assert \A n \in 1..Len(result) : \/ ~({ result[n] } \subseteq singleInstance)
                                         \/ ({ result[n] } \subseteq singleInstance) /\ ((n - 1 >= 1 /\ { result[n - 1] } \subseteq singleInstance) \/ (n + 1 <= Len(result) /\ { result[n + 1] } \subseteq singleInstance));
    }
}
*)
\* BEGIN TRANSLATION (chksum(pcal) = "26acebfb" /\ chksum(tla) = "e08c89ff")
CONSTANT defaultInitValue
VARIABLES antepenultimate, previous, current, singleInstance, i, input, 
          result, domainSize, domain, characterMapping, pc

vars == << antepenultimate, previous, current, singleInstance, i, input, 
           result, domainSize, domain, characterMapping, pc >>

Init == (* Global variables *)
        /\ antepenultimate = defaultInitValue
        /\ previous = defaultInitValue
        /\ current = ""
        /\ singleInstance = { "0" }
        /\ i = 1
        /\ input = << >>
        /\ result = << >>
        /\ domainSize \in 1..5
        /\ domain \in [1..domainSize -> 1..2]
        /\ characterMapping = << "a", "0" >>
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF i =< Len(domain)
               THEN /\ input' = Append(input, characterMapping[domain[i]])
                    /\ i' = i + 1
                    /\ pc' = "Lbl_1"
               ELSE /\ i' = 1
                    /\ pc' = "Lbl_2"
                    /\ input' = input
         /\ UNCHANGED << antepenultimate, previous, current, singleInstance, 
                         result, domainSize, domain, characterMapping >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF i =< Len(input)
               THEN /\ current' = input[i]
                    /\ IF ~(previous = "")
                          THEN /\ IF ~({ previous } \subseteq singleInstance) \/ ({ current' } \subseteq singleInstance)
                                     THEN /\ result' = Append(result, previous)
                                     ELSE /\ IF { antepenultimate } \subseteq singleInstance
                                                THEN /\ result' = Append(result, previous)
                                                ELSE /\ TRUE
                                                     /\ UNCHANGED result
                          ELSE /\ TRUE
                               /\ UNCHANGED result
                    /\ antepenultimate' = previous
                    /\ previous' = current'
                    /\ pc' = "Lbl_3"
               ELSE /\ IF ~(previous = "")
                          THEN /\ IF ~({ previous } \subseteq singleInstance) \/ ({ current } \subseteq singleInstance)
                                     THEN /\ result' = Append(result, previous)
                                     ELSE /\ IF { antepenultimate } \subseteq singleInstance
                                                THEN /\ result' = Append(result, previous)
                                                ELSE /\ TRUE
                                                     /\ UNCHANGED result
                          ELSE /\ TRUE
                               /\ UNCHANGED result
                    /\ Assert(\A n \in 1..Len(result') : \/ ~({ result'[n] } \subseteq singleInstance)
                                                         \/ ({ result'[n] } \subseteq singleInstance) /\ ((n - 1 >= 1 /\ { result'[n - 1] } \subseteq singleInstance) \/ (n + 1 <= Len(result') /\ { result'[n + 1] } \subseteq singleInstance)), 
                              "Failure of assertion at line 54, column 9.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << antepenultimate, previous, current >>
         /\ UNCHANGED << singleInstance, i, input, domainSize, domain, 
                         characterMapping >>

Lbl_3 == /\ pc = "Lbl_3"
         /\ current' = ""
         /\ i' = i + 1
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << antepenultimate, previous, singleInstance, input, 
                         result, domainSize, domain, characterMapping >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2 \/ Lbl_3
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Mon Nov 03 22:22:15 EST 2025 by rbolh
\* Created Mon Nov 03 22:20:02 EST 2025 by rbolh
