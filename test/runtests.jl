using Test, Documenter, ZXCalculusForCAP

# test upto whitespaces
doctest(ZXCalculusForCAP; doctestfilters=[r"\s+" => ""])
