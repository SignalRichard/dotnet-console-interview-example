package no_single_instance_characters_test

import data.no_single_instance_characters

characters := ["0", "2", "4", "6", "8"]

test_valid_when_empty if {
	no_single_instance_characters.valid with input as {"str": ""}
		with data.characters as characters
}

test_valid_pass if {
	no_single_instance_characters.valid with input as {"str": "22 Park Avenue"}
		with data.characters as characters
}

test_valid_fail if {
	not no_single_instance_characters.valid with input as {"str": "4ever"}
		with data.characters as characters
}
