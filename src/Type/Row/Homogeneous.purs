module Type.Row.Homogeneous
  ( class Homogeneous
  , class HomogeneousRowList
  ) where

import Type.Equality (class TypeEquals)
import Type.RowList (class RowToList, Cons, Nil, kind RowList)

-- | Ensure that every field in a row has the same type.
class Homogeneous (row :: # Type) fieldType | row -> fieldType
instance homogeneous
  :: ( RowToList row fields
     , HomogeneousRowList fields fieldType )
  => Homogeneous row fieldType

class HomogeneousRowList (rowList :: RowList) fieldType | rowList -> fieldType
instance homogeneousRowListCons
  :: ( HomogeneousRowList tail fieldType
     , TypeEquals fieldType fieldType2 )
  => HomogeneousRowList (Cons symbol fieldType tail) fieldType2
instance homogeneousRowListNil :: HomogeneousRowList Nil fieldType
