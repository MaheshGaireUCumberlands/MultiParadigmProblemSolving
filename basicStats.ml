let mean lst =
  let sum = List.fold_left (+.) 0.0 lst in
  sum /. (float_of_int (List.length lst))

let median lst =
  let sorted = List.sort compare lst in
  let n = List.length sorted in
  if n mod 2 = 0 then
    (List.nth sorted (n/2 -1) + List.nth sorted (n/2)) / 2
  else
    List.nth sorted (n/2)

let mode lst =
  let tbl = Hashtbl.create 10 in
  List.iter (fun x -> Hashtbl.replace tbl x ((try Hashtbl.find tbl x with Not_found -> 0) + 1)) lst;
  let max_count = Hashtbl.fold (fun _ v acc -> if v > acc then v else acc) tbl 0 in
  Hashtbl.iter (fun k v -> if v = max_count then Printf.printf "%d " k) tbl;
  print_newline ()

let () =
  let lst = [1;2;2;3;4;5;5;5] in
  Printf.printf "Mean: %.2f\n" (mean (List.map float_of_int lst));
  Printf.printf "Median: %d\n" (median lst);
  print_string "Mode(s): "; mode lst
