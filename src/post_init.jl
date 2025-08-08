# convenience converting Int to BigInt

##
function ObjectConstructor(cat::IsCategoryOfZXDiagrams.abstract_type, n::Int)
    ObjectConstructor(cat, BigInt(n));
end

##
function MorphismConstructor(s::IsObjectInCategoryOfZXDiagrams.abstract_type, graph::Tuple{Vector{String}, Vector{Vector{Int64}}}, t::IsObjectInCategoryOfZXDiagrams.abstract_type)
	MorphismConstructor(s, [graph[1], map(edge -> [ BigInt( edge[1] ), BigInt( edge[2] ) ], graph[2])], t)
end
