package no_single_instance_characters

default _characters := {c | some c in data.characters}

default valid := false

# METADATA
# related_resources:
# - ../spec/RemoveSingleInstanceCharacters.tla
# scope: document
# entrypoint: true
valid if {
	arr := split(input.str, "")

	# \A n \in 1..Len(result)
	every n in numbers.range(0, count(arr) - 1) {
		_is_valid(n, arr)
	}
}

valid if {
	input.str == ""
}

_is_valid(n, arr) if {
	# \/ ~({ result[n] } \subseteq singleInstance)

	c := arr[n]
	count({c} & _characters) == 0
}

_is_valid(n, arr) if {
	# \/ { result[n] } \subseteq singleInstance) /\ ((n - 1 >= 1 /\ { result[n - 1] } \subseteq singleInstance)
	n - 1 >= 0
	count({arr[n]} & _characters) > 0
	count({arr[n - 1]} & _characters) > 0
}

_is_valid(n, arr) if {
	# \/ (n + 1 <= Len(result) /\ { result[n + 1] } \subseteq singleInstance)
	n + 1 < count(arr)
	count({arr[n]} & _characters) > 0
	count({arr[n + 1]} & _characters) > 0
}
