(* Find all integers m > 1 for which every unit modulo m is its own
   inverse. Run with "ocaml check_cases.ml". *)

let rec gcd a b = (* Euclid's algorithm *)
  if b = 0 then abs a else gcd b (a mod b)  

let coprime a b = gcd a b = 1

let units m = (* Compute the collection of units modulo m. *)
  Seq.ints 0 |> Seq.take m |> Seq.filter (coprime m)
                
let auto_inverse ~modulus a = (* Is a its own modular inverse? *)
  a * a mod modulus = 1
                            
let all_auto_inverses m = 
(* Are all units their own inverses modulo m? *)
  Seq.for_all (auto_inverse ~modulus:m) (units m)

let results =
  (* Find all m < 49 where all units are their own 
     inverses modulo m. *)
  Seq.ints 1
  |> Seq.take 48
  |> Seq.filter all_auto_inverses
  |> List.of_seq

let main =
  (* Print the results. *)
  let pp_comma ff () = Format.fprintf ff ", " in
  let pp_list = Format.pp_print_list ~pp_sep:pp_comma Format.pp_print_int in
  Format.printf "Results = {%a}\n" pp_list results

