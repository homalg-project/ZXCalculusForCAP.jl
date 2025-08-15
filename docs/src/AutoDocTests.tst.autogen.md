
```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, ZXCalculusForCAP

julia> true
true

julia> ZX
CategoryOfZXDiagrams( )

julia> zero = Qubits( 0 )
<An object in CategoryOfZXDiagrams( ) representing 0 input/output vertices>

julia> one = Qubits( 1 )
<An object in CategoryOfZXDiagrams( ) representing 1 input/output vertices>

julia> two = Qubits( 2 )
<An object in CategoryOfZXDiagrams( ) representing 2 input/output vertices>

julia> three = Qubits( 3 )
<An object in CategoryOfZXDiagrams( ) representing 3 input/output vertices>

julia> three == one + two
true

julia> three == zero + three
true

julia> three == 3 * one
true

julia> id = IdentityMorphism( one )
<A morphism in CategoryOfZXDiagrams( )>

julia> id3 = IdentityMorphism( three )
<A morphism in CategoryOfZXDiagrams( )>

julia> id3 == 3 * id
true

julia> ev = EvaluationForDual( three )
<A morphism in CategoryOfZXDiagrams( )>

julia> coev = CoevaluationForDual( three )
<A morphism in CategoryOfZXDiagrams( )>

julia> PreCompose( ev, IdentityMorphism( zero ) )
<A morphism in CategoryOfZXDiagrams( )>

julia> PreCompose( IdentityMorphism( TensorProduct( three, three ) ), ev )
<A morphism in CategoryOfZXDiagrams( )>

julia> PreCompose( coev, IdentityMorphism( TensorProduct( three, three ) ) )
<A morphism in CategoryOfZXDiagrams( )>

julia> PreCompose( IdentityMorphism( zero ), coev )
<A morphism in CategoryOfZXDiagrams( )>

julia> Display( PreCompose( coev, ev ) )
A morphism in CategoryOfZXDiagrams( ) given by a ZX-diagram with 0 vertex labels
  [  ],
  inputs
  [  ],
  outputs
  [  ],
  and 0 edges
  [  ].

julia> Display( PreCompose( ev, coev ) )
A morphism in CategoryOfZXDiagrams( ) given by a ZX-diagram with 6 vertex labels
  [ "neutral", "neutral", "neutral", "neutral", "neutral", "neutral" ],
  inputs
  [ 0, 1, 2, 0, 1, 2 ],
  outputs
  [ 3, 4, 5, 3, 4, 5 ],
  and 0 edges
  [  ].

julia> IdentityMorphism( one ) + IdentityMorphism( two ) == id3
true

julia> AssociatorLeftToRight( zero, one, two ) == id3
true

julia> AssociatorRightToLeft( zero, one, two ) == id3
true

julia> LeftUnitor( three ) == id3
true

julia> LeftUnitorInverse( three ) == id3
true

julia> RightUnitor( three ) == id3
true

julia> RightUnitorInverse( three ) == id3
true

julia> Braiding( one, two ) == BraidingInverse( two, one )
true

julia> X_1_1 = X_Spider( 1, 1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( X_1_1 )
true

julia> Z_1_1 = Z_Spider( 1, 1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( Z_1_1 )
true

julia> H = H_Gate( )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( H )
true

julia> X_1_2 = X_Spider( 1, 2 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( X_1_2 )
true

julia> Z_2_1 = Z_Spider( 2, 1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( Z_2_1 )
true

julia> X_1_2_Z_2_1 = PreCompose( X_1_2, Z_2_1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( X_1_2_Z_2_1 )
true

julia> GHZ = ( 3 * X_Spider( 0, 1 ) ) * ( id + H + id ) *
               ( X_1_2 + Z_Spider( 1, 1 ) + X_1_2 ) *
               ( id + Z_Spider( 3, 1 ) + id )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefined( GHZ )
true

```

```jldoctest AutoDocTests
julia> using CAP, MonoidalCategories, ZXCalculusForCAP

julia> true
true

julia> ZX
CategoryOfZXDiagrams( )

julia> X_1_2 = X_Spider( 1, 2 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( X_1_2 )
true

julia> Z_2_1 = Z_Spider( 2, 1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( Z_2_1 )
true

julia> X_1_2_Z_2_1 = PreCompose( X_1_2, Z_2_1 )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( X_1_2_Z_2_1 )
true

julia> tmp_dir = DirectoryTemporary( );

julia> ExportAsQGraphFile( X_1_2_Z_2_1, Filename( tmp_dir, "X_1_2_Z_2_1" ) )

julia> reimported = ImportFromQGraphFile( ZX, Filename( tmp_dir, "X_1_2_Z_2_1" ) )
<A morphism in CategoryOfZXDiagrams( )>

julia> IsWellDefinedForMorphisms( reimported )
true

julia> json = ExportAsQGraphString( X_1_2_Z_2_1 );

julia> mor1 = ImportFromQGraphString( ZX, json );

julia> json2 = ExportAsQGraphString( mor1 );

julia> mor2 = ImportFromQGraphString( ZX, json2 );

julia> json3 = ExportAsQGraphString( mor2 );

julia> mor3 = ImportFromQGraphString( ZX, json3 );

julia> IsEqualForMorphisms( mor2, mor3 ) && json2 == json3
true

```
