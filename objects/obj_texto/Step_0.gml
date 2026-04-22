if (activo) {
    input_name = keyboard_string;
    if (string_length(input_name) > 20) {
        input_name      = string_copy(input_name, 1, 20);
        keyboard_string = input_name;
    }
}