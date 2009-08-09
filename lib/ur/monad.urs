val exec : m ::: (Type -> Type) -> monad m -> ts ::: {Type}
           -> $(map m ts) -> folder ts -> m $ts

val ignore : m ::: (Type -> Type) -> monad m -> t ::: Type
             -> m t -> m unit

val foldR : K --> m ::: (Type -> Type) -> monad m
            -> tf :: (K -> Type)
            -> tr :: ({K} -> Type)
            -> (nm :: Name -> t :: K -> rest :: {K}
                -> [[nm] ~ rest] =>
                tf t -> tr rest -> m (tr ([nm = t] ++ rest)))
            -> tr []
            -> r :: {K} -> folder r -> $(map tf r) -> m (tr r)

val foldR2 : K --> m ::: (Type -> Type) -> monad m
             -> tf1 :: (K -> Type) -> tf2 :: (K -> Type)
             -> tr :: ({K} -> Type)
             -> (nm :: Name -> t :: K -> rest :: {K}
                 -> [[nm] ~ rest] =>
                       tf1 t -> tf2 t -> tr rest -> m (tr ([nm = t] ++ rest)))
             -> tr []
             -> r :: {K} -> folder r -> $(map tf1 r) -> $(map tf2 r) -> m (tr r)

val mapR : K --> m ::: (Type -> Type) -> monad m
           -> tf :: (K -> Type)
           -> tr :: (K -> Type)
           -> (nm :: Name -> t :: K -> tf t -> m (tr t))
           -> r :: {K} -> folder r -> $(map tf r) -> m ($(map tr r))
