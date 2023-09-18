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

# Función para generar un ejemplo de HTML con un contenedor y clase CSS, y guarda el resultado en un archivo
generate_html() {
    local example_number="$1"
    local css_class="$2"
    local file_name="example$example_number.html"
    
    echo "<!DOCTYPE html>" > "$file_name"
    echo "<html lang=\"en\">" >> "$file_name"
    echo "<head>" >> "$file_name"
    echo "    <meta charset=\"UTF-8\">" >> "$file_name"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> "$file_name"
    echo "    <title>Example $example_number</title>" >> "$file_name"
    echo "    <style>" >> "$file_name"
    echo "        .$css_class {" >> "$file_name"
    echo "            /* Add your styles here */" >> "$file_name"
    echo "        }" >> "$file_name"
    echo "    </style>" >> "$file_name"
    echo "</head>" >> "$file_name"
    echo "<body>" >> "$file_name"
    echo "    <div class=\"$css_class\">" >> "$file_name"
    echo "        <!-- Your elements go here -->" >> "$file_name"
    echo "    </div>" >> "$file_name"
    echo "</body>" >> "$file_name"
    echo "</html>" >> "$file_name"

    echo "Generated: $file_name"
}

# Limpiar archivos HTML y CSS antiguos
rm -f example*.html example*.css

# Ejemplo 1: display y flex-direction
generate_css "display" "flex inline-flex"
generate_css "flex-direction" "row row-reverse column column-reverse"

generate_html 1 "example1-container"

# Ejemplo 2: flex-wrap
generate_css "flex-wrap" "nowrap wrap wrap-reverse"

generate_html 2 "example2-container"

# Ejemplo 3: justify-content
generate_css "justify-content" "flex-start flex-end center space-between space-around space-evenly"

generate_html 3 "example3-container"

# Ejemplo 4: align-items y align-content
generate_css "align-items" "flex-start flex-end center baseline stretch"
generate_css "align-content" "flex-start flex-end center space-between space-around stretch"

generate_html 4 "example4-container"

# Ejemplo 5: order, flex-grow, flex-basis, flex-shrink y align-self
# Este ejemplo no generará automáticamente HTML ya que los estilos son específicos para elementos individuales.

echo "Examples generated successfully!"
