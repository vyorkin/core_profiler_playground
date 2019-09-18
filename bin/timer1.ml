open Core
open Core_profiler.Std_offline

let t1 = Timer.create ~name:"func"
let t2 = Timer.create ~name:"array_len"

let func () =
  Timer.record t1;
  let len = 100 in
  let key = Random.int 100 in
  if key mod 3 <> 0 then begin
    ignore (Array.create ~len 10);
    Timer.record t2
  end

let () =
  for _i = 1 to 10_000_000 do
    func ()
  done
