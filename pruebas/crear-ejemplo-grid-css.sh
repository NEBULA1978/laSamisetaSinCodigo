#!/bin/bash

# Función para generar un ejemplo de CSS con los valores proporcionados
generate_css() {
    local property="$1"
    shift
    local values=("$@")
    
    echo "/* Example with $property */"
    echo ".container {"
    for value in "${values[@]}"; do
        echo "    $property: $value;"
    done
    echo "}"
    echo
}

# Función para generar un ejemplo de HTML con un contenedor y enlace a un archivo CSS, y guarda el resultado en un archivo
generate_html() {
    local example_number="$1"
    local css_class="$2"
    local file_name="example$example_number.html"
    local css_file="example$example_number.css"
    
    echo "<!DOCTYPE html>" > "$file_name"
    echo "<html lang=\"en\">" >> "$file_name"
    echo "<head>" >> "$file_name"
    echo "    <meta charset=\"UTF-8\">" >> "$file_name"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "$file_name"
    echo "    <title>Example $example_number</title>" >> "$file_name"
    echo "    <link rel=\"stylesheet\" type=\"text/css\" href=\"$css_file\">" >> "$file_name"
    echo "</head>" >> "$file_name"
    echo "<body>" >> "$file_name"
    echo "    <div class=\"$css_class\">" >> "$file_name"
    echo "        <!-- Your elements go here -->" >> "$file_name"
    echo "    </div>" >> "$file_name"
    echo "</body>" >> "$file_name"
    echo "</html>" >> "$file_name"

    echo "Generated: $file_name"

    # Crear el archivo CSS correspondiente
    generate_css_for_html "$example_number" "$css_class"
}

# Función para generar el archivo CSS correspondiente a un archivo HTML
generate_css_for_html() {
    local example_number="$1"
    local css_class="$2"
    local css_file="example$example_number.css"

    echo "/* CSS styles for $css_class */" > "$css_file"
    echo ".$css_class {" >> "$css_file"
    echo "    /* Add your styles here */" >> "$css_file"
    echo "}" >> "$css_file"
}

# Limpiar archivos HTML y CSS antiguos
rm -f example*.html example*.css

# Ejemplo 1: display y flex-direction
generate_html 1 "example1-container"

# Ejemplo 2: flex-wrap
generate_html 2 "example2-container"

# Ejemplo 3: justify-content
generate_html 3 "example3-container"

# Ejemplo 4: align-items y align-content
generate_html 4 "example4-container"

echo "Examples generated successfully!"
