package example


type WowStruct[T int|float32] struct {
	Data []T
	MaxValue T
	MinValue T
}

func wowStruct() {
	var ws WowStruct[int]
}