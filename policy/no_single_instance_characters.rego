package no_single_instance_characters

default characters := {x | x := data.characters[_]}
default valid := false

valid if {
    arr := split(input.str, "")
	# \A n \in 1..Len(result)
	every n in numbers.range(0, count(arr) - 1) {
		is_valid(n, arr)
	}
}

valid if {
    input.str == ""
}

# \/ ~({ result[n] } \subseteq singleInstance)
is_valid(n, arr) if {
	c := arr[n]
	count({c} & characters) == 0
}

# \/ { result[n] } \subseteq singleInstance) /\ ((n - 1 >= 1 /\ { result[n - 1] } \subseteq singleInstance)
is_valid(n, arr) if {
	n - 1 >= 0
	count({arr[n]} & characters) > 0
	count({arr[n - 1]} & characters) > 0
}

# \/ (n + 1 <= Len(result) /\ { result[n + 1] } \subseteq singleInstance)
is_valid(n, arr) if {
	n + 1 < count(arr)
	count({arr[n]} & characters) > 0
	count({arr[n + 1]} & characters) > 0
}
