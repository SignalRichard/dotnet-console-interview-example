Feature: Remove single instance characters

  Rule: Specified instances of single characters in a string are removed

    Example: Remove single instance even numbers
      Given the string "21 Park Avenue"
      And the single instance characters ["0", "2", "4", "6", "8"]
      When the given string contains single instances of the specified characters
      Then they are removed from the string
      And the string becomes "1 Park Avenue"
