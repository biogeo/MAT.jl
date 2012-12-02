load("MATv5")
using MATv5

result = {
	"int8" => int8(1),
	"uint8" => uint8(1),
	"int16" => int16(1),
	"uint16" => uint16(1),
	"int32" => int32(1),
	"uint32" => uint32(1),
	"int64" => int64(1),
	"uint64" => uint64(1),
	"single" => float32(1),
	"double" => 1.01
}
@time mat = matread("tests/simple.mat")
@assert result == mat
for (k, v) in result
	if(typeof(mat[k]) != typeof(v))
		error("Types for $k didn't match (expected $(typeof(v)), got $(typeof(mat[k])))")
	end
end

result = {
	"a1x2" => [1.0 2.0],
	"a2x1" => [1.0; 2.0],
	"a2x2" => [1.0 3.0; 4.0 2.0],
	"a2x2x2" => cat(3, [1.0 3.0; 4.0 2.0], [1.0 2.0; 3.0 4.0]),
	"empty" => Float64[],
	"string" => "string"
}
mat = matread("tests/array.mat")
println(result)
println(mat)
@assert result == mat