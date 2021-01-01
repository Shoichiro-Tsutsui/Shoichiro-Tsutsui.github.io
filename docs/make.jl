using Documenter
#using DocumenterLaTeX

################################################################################
# How to generate the document
# Run the following command from the docs/ directory
# >julia make.jl

# How to see the document
# Run the following command from the build/ directory
# >python -m http.server --bind localhost
# See http://localhost:8000 in your browser

# Math typesetting
# Documenter uses KaTeX
# https://katex.org/

# Generate Sass files.
for w in ("light", "dark")
    header = read(joinpath(@__DIR__, "style.scss"), String)
    theme = read(joinpath(@__DIR__, "$(w)defs.scss"), String)
    write(joinpath(@__DIR__, "$(w).scss"), header*"\n"*theme)
end

# Compile Sass files.
using DocumenterTools: Themes
Themes.compile(joinpath(@__DIR__, "light.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-light.css"))
Themes.compile(joinpath(@__DIR__, "dark.scss"), joinpath(@__DIR__, "src/assets/themes/documenter-dark.css"))

# Generate HTML files.
makedocs(
    sitename = "Shoichiro Tsutsui's Web Page",
    authors = "Shoichiro Tsutsui",
    doctest = false,
    clean = true,
    linkcheck = false,
    pages = [
        "Home" => "index.md",
        "CV" => "cv.md",
        "Publications" => "publications.md",
        "Presentationss" => "presentations.md",
        "Links" => "links.md"
        ],
    )
