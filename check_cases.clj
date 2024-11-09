(defn euclid
  "Compute the greatest common divisor using Euclid's algorithms."
  [a b]
  (assert (and (integer? a) (integer? b)) "Expecting integers.")
  (loop [a a b b]
    (if (= b 0)
      (Math/abs a)
      (recur b (mod a b)))))

(defn gcd 
  "Compute the greatest common divisor of integers."
  [& rest]
  (reduce euclid 0 rest))

(defn units
  "Compute the units modulo m."
  [m]
  (assert (and (integer? m) (> m 0)) "Need positive integer.")
  (filter #(= (gcd % m) 1) (range m)))

(defn self-inverse
  "Check whether 'a' is its own inverse modulo 'm'."
  [a m]
  (assert (integer? a) "Need integer.")
  (= (mod (* a a) m) 1))

(defn all-inverses-self
  "Check whether all units modulo 'm' are their own inverses."
  [m]
  (assert (and (integer? m) (> m 0)) "Need positive integer.")
  (every? #(self-inverse % m) (units m)))

(def result
  "All numbers 'm' (except 1) where every unit modulo 'm' is its on inverse."
  (filter all-inverses-self (range 1 49)))

(println result)
