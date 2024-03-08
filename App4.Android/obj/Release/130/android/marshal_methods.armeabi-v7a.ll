; ModuleID = 'obj\Release\130\android\marshal_methods.armeabi-v7a.ll'
source_filename = "obj\Release\130\android\marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [98 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 38
	i32 57263871, ; 1: Xamarin.Forms.Core.dll => 0x369c6ff => 33
	i32 134690465, ; 2: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 42
	i32 182336117, ; 3: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 30
	i32 209399409, ; 4: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 15
	i32 318968648, ; 5: Xamarin.AndroidX.Activity.dll => 0x13031348 => 12
	i32 321597661, ; 6: System.Numerics => 0x132b30dd => 10
	i32 342366114, ; 7: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 24
	i32 442521989, ; 8: Xamarin.Essentials => 0x1a605985 => 32
	i32 450948140, ; 9: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 22
	i32 465846621, ; 10: mscorlib => 0x1bc4415d => 7
	i32 469710990, ; 11: System.dll => 0x1bff388e => 9
	i32 527452488, ; 12: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 42
	i32 536722588, ; 13: App4.dll => 0x1ffdbc9c => 3
	i32 627609679, ; 14: Xamarin.AndroidX.CustomView => 0x2568904f => 20
	i32 691348768, ; 15: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 44
	i32 700284507, ; 16: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 39
	i32 720511267, ; 17: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 43
	i32 809851609, ; 18: System.Drawing.Common.dll => 0x30455ad9 => 47
	i32 928116545, ; 19: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 38
	i32 956575887, ; 20: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 43
	i32 967690846, ; 21: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 24
	i32 974778368, ; 22: FormsViewGroup.dll => 0x3a19f000 => 4
	i32 1012816738, ; 23: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 29
	i32 1035644815, ; 24: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 14
	i32 1042160112, ; 25: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 35
	i32 1052210849, ; 26: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 26
	i32 1084122840, ; 27: Xamarin.Kotlin.StdLib => 0x409e66d8 => 41
	i32 1098259244, ; 28: System => 0x41761b2c => 9
	i32 1275534314, ; 29: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 44
	i32 1293217323, ; 30: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 21
	i32 1365406463, ; 31: System.ServiceModel.Internals.dll => 0x516272ff => 46
	i32 1376866003, ; 32: Xamarin.AndroidX.SavedState => 0x52114ed3 => 29
	i32 1406073936, ; 33: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 17
	i32 1460219004, ; 34: Xamarin.Forms.Xaml => 0x57092c7c => 36
	i32 1469204771, ; 35: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 13
	i32 1592978981, ; 36: System.Runtime.Serialization.dll => 0x5ef2ee25 => 2
	i32 1622152042, ; 37: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 27
	i32 1636350590, ; 38: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 19
	i32 1639515021, ; 39: System.Net.Http.dll => 0x61b9038d => 1
	i32 1658251792, ; 40: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 37
	i32 1698840827, ; 41: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 40
	i32 1729485958, ; 42: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 16
	i32 1766324549, ; 43: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 30
	i32 1776026572, ; 44: System.Core.dll => 0x69dc03cc => 8
	i32 1788241197, ; 45: Xamarin.AndroidX.Fragment => 0x6a96652d => 22
	i32 1808609942, ; 46: Xamarin.AndroidX.Loader => 0x6bcd3296 => 27
	i32 1813058853, ; 47: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 41
	i32 1813201214, ; 48: Xamarin.Google.Android.Material => 0x6c13413e => 37
	i32 1867746548, ; 49: Xamarin.Essentials.dll => 0x6f538cf4 => 32
	i32 1878053835, ; 50: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 36
	i32 1983156543, ; 51: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 40
	i32 2019465201, ; 52: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 26
	i32 2055257422, ; 53: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 25
	i32 2097448633, ; 54: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 23
	i32 2126786730, ; 55: Xamarin.Forms.Platform.Android => 0x7ec430aa => 34
	i32 2201107256, ; 56: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 45
	i32 2201231467, ; 57: System.Net.Http => 0x8334206b => 1
	i32 2279755925, ; 58: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 28
	i32 2475788418, ; 59: Java.Interop.dll => 0x93918882 => 5
	i32 2605712449, ; 60: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 45
	i32 2620871830, ; 61: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 19
	i32 2732626843, ; 62: Xamarin.AndroidX.Activity => 0xa2e0939b => 12
	i32 2737747696, ; 63: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 13
	i32 2766581644, ; 64: Xamarin.Forms.Core => 0xa4e6af8c => 33
	i32 2770495804, ; 65: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 39
	i32 2778768386, ; 66: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 31
	i32 2810250172, ; 67: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 17
	i32 2819470561, ; 68: System.Xml.dll => 0xa80db4e1 => 11
	i32 2853208004, ; 69: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 31
	i32 2905242038, ; 70: mscorlib.dll => 0xad2a79b6 => 7
	i32 2978675010, ; 71: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 21
	i32 3044182254, ; 72: FormsViewGroup => 0xb57288ee => 4
	i32 3111772706, ; 73: System.Runtime.Serialization => 0xb979e222 => 2
	i32 3155842086, ; 74: App4 => 0xbc1a5426 => 3
	i32 3247949154, ; 75: Mono.Security => 0xc197c562 => 48
	i32 3258312781, ; 76: Xamarin.AndroidX.CardView => 0xc235e84d => 16
	i32 3317135071, ; 77: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 20
	i32 3353484488, ; 78: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 23
	i32 3362522851, ; 79: Xamarin.AndroidX.Core => 0xc86c06e3 => 18
	i32 3366347497, ; 80: Java.Interop => 0xc8a662e9 => 5
	i32 3374999561, ; 81: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 28
	i32 3404865022, ; 82: System.ServiceModel.Internals => 0xcaf21dfe => 46
	i32 3429136800, ; 83: System.Xml => 0xcc6479a0 => 11
	i32 3476120550, ; 84: Mono.Android => 0xcf3163e6 => 6
	i32 3536029504, ; 85: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 34
	i32 3632359727, ; 86: Xamarin.Forms.Platform => 0xd881692f => 35
	i32 3641597786, ; 87: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 25
	i32 3672681054, ; 88: Mono.Android.dll => 0xdae8aa5e => 6
	i32 3682565725, ; 89: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 15
	i32 3689375977, ; 90: System.Drawing.Common => 0xdbe768e9 => 47
	i32 3829621856, ; 91: System.Numerics.dll => 0xe4436460 => 10
	i32 3896760992, ; 92: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 18
	i32 3955647286, ; 93: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 14
	i32 4091744694, ; 94: App4.Android.dll => 0xf3e311b6 => 0
	i32 4105002889, ; 95: Mono.Security.dll => 0xf4ad5f89 => 48
	i32 4151237749, ; 96: System.Core => 0xf76edc75 => 8
	i32 4243023817 ; 97: App4.Android => 0xfce767c9 => 0
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [98 x i32] [
	i32 38, i32 33, i32 42, i32 30, i32 15, i32 12, i32 10, i32 24, ; 0..7
	i32 32, i32 22, i32 7, i32 9, i32 42, i32 3, i32 20, i32 44, ; 8..15
	i32 39, i32 43, i32 47, i32 38, i32 43, i32 24, i32 4, i32 29, ; 16..23
	i32 14, i32 35, i32 26, i32 41, i32 9, i32 44, i32 21, i32 46, ; 24..31
	i32 29, i32 17, i32 36, i32 13, i32 2, i32 27, i32 19, i32 1, ; 32..39
	i32 37, i32 40, i32 16, i32 30, i32 8, i32 22, i32 27, i32 41, ; 40..47
	i32 37, i32 32, i32 36, i32 40, i32 26, i32 25, i32 23, i32 34, ; 48..55
	i32 45, i32 1, i32 28, i32 5, i32 45, i32 19, i32 12, i32 13, ; 56..63
	i32 33, i32 39, i32 31, i32 17, i32 11, i32 31, i32 7, i32 21, ; 64..71
	i32 4, i32 2, i32 3, i32 48, i32 16, i32 20, i32 23, i32 18, ; 72..79
	i32 5, i32 28, i32 46, i32 11, i32 6, i32 34, i32 35, i32 25, ; 80..87
	i32 6, i32 15, i32 47, i32 10, i32 18, i32 14, i32 0, i32 48, ; 88..95
	i32 8, i32 0 ; 96..97
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
