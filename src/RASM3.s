// Programer: Andrew Cesario
// RASM3
// Purpose: Test functions for 3 strings
// Author: Andrew Cesario, Allan
// Date: 3/24/2023

// Define a constant named SIZE with a value of 21
.EQU SIZE, 21

// Declare the _start label as a global symbol
.global main

// _start label marks the beginning of the program
main:
// prompt #11   

	ldr x0, =szIndex1  //"String_indexOf_1(s2,\'g\') = "
	bl putstring
	
	//outpute the index and return in x0
	ldr x1, =s2  //string
	ldr x2, =arg_13   //char
	bl String_indexOf_1
	
	//Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
	//skip a line in the end
    ldr     x0, =chCr
    bl      putch
    
// prompt #12
    ldr     x0, =szIndex2
    bl      putstring
	
	ldr x0, =s2  //string
	ldr x1, =arg_13   //char
	mov x2, #9  //passing int like this fixed segmentation fault
	bl String_indexOf_2  //returns value in x0
	
    //Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
    ldr     x0, =chCr
    bl      putch
    
// prompt #13  ; string is returdned not a int
    ldr     x0, =szIndex3
    bl      putstring
    
	//outpute the index and return in x0
	//since im loading them correctly it has to be the functions thats fucked
	ldr x0, =s2b  //string
	ldr x1, =szEggs //substring
	bl String_indexOf_3 //return value in x0
	
	//Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
    ldr     x0, =chCr
    bl      putch
    
	
// prompt #14
    ldr     x0, =szLastIndex1
    bl      putstring  
	
	ldr x0, =s2  //string "Green eggs and ham."
	ldr x2, =arg_13  //char 'g'
	bl String_lastIndexOf_1 //returns value in x0
	
    //Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
    ldr     x0, =chCr
    bl      putch
	
// prompt #15
    ldr     x0, =szLastIndex2
    bl      putstring
	
	ldr x0, =s2  //string
	ldr x1, =arg_13 
	mov x2, #6   //int
	bl String_lastIndexOf_2  //returns value in x0
	
    //Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
	ldr     x0, =chCr
    bl      putch
    
// prompt #16
    ldr     x0, =szLastIndex3
    bl      putstring
	
	//outpute the index and return in x0
	//since im loading them correctly it has to be the functions thats fucked
	ldr x0, =s2b  //string
	ldr x1, =szEggs //substring
	bl String_indexOf_3 //return value in x0
	
	//Store x0 in szResult
	ldr x3, =szResult
	str x0, [x3]
	
	//convert value in szResult into string 
	ldr x1, =szResult
	bl int64asc
	
	//output string
	ldr x0, =szResult
	bl putstring
	
    ldr     x0, =chCr
    bl      putch
    
    
// prompt #17  //segmentation fault

    ldr     x0, =szReplace
    bl      putstring
	
	/*
	
	ldr x1, =s2b  // "Green eggs and ham."
	ldr x2, =arg_17a //'a'
	ldr x3, =arg_17b  //'o'
	bl String_replace
    //xo holds new string
	bl putstring
	*/
	
    ldr     x0, =chCr
    bl      putch  
      
// prompt #18    //doesnt output
    ldr     x0, =szLower
    bl      putstring
	
	ldr x0, =s1b // "Cot in the hot."  
	bl String_toLowerCase 
	bl putstring

	ldr     x0, =szQuote
    bl      putstring
	
    ldr     x0, =chCr
    bl      putch 
        
// prompt #19  //segmentation fault
    ldr     x0, =szUpper
    bl      putstring
	
	ldr x0, =s1b // "Cot in the hot."  
	bl String_toUpperCase 
	bl putstring

	ldr     x0, =szQuote
    bl      putstring
	
    ldr     x0, =chCr
    bl      putch
        
// prompt #20  //gonna output from within subroutine
    ldr     x0, =szConcat
    bl      putstring
	
	ldr x0, =s1c   //idk why, if i load s1, doesnt output
	bl String_length
	mov x3, x0 //move s1 length into x2
	
	ldr x0, =szSpace
	bl String_length
	mov x4, x0 //move szSpace into x3
	
	ldr x1, =s1b
	ldr x2, =szSpace
	mov x3, x3  //lenght of s1b
	mov x4, x4  //length of szSpace
	bl String_concat
	
	ldr     x0, =szQuote
    bl      putstring
	
    ldr     x0, =chCr
    bl      putch
        
    b end

/*
// Output for true and false
boolean:
    cmp     x0, #1
    b.eq    true
    
    ldr     x0, =szFalse
    ret
    
true:
    ldr     x0, =szTrue
    ret
   */
   
end:
// Setup the parameters to exit the program
// and then call Linux to do it.
    mov     X0, #0         // Use 0 return code
    mov     X8, #93        // Service command code 93 terminates this program
    svc     0              // Call linux to terminate the program

.data // Data values
s1:              .asciz   "Cat in the hat."
s2:              .asciz   "Green eggs and ham."
s3:              .asciz   "cat in the hat."
s4:              .skip    25
s1Length:        .asciz   "s1.length() = "
s2Length:        .asciz   "s2.length() = "
s3Length:        .asciz   "s3.length() = "
szEquals1:       .asciz   "String_equals(s1,s3) = "
szEquals2:       .asciz   "String_equals(s1,s1) = "
szEqualsIgnore1: .asciz    "String_equalsIgnoreCase(s1,s3) = "
szEqualsIgnore2: .asciz    "String_equalsIgnoreCase(s1,s2) = "
szCopy:          .asciz  "s4 = String_copy(s1)\n"
s1Copy:          .asciz  "s1 = "
s4Copy:          .asciz  "s4 = "
szSubstring1:    .asciz    "String_substring_1(s3,4,14) = \""
szSubstring2:    .asciz    "String_substring_2(s3,7) = \""
szCharAt:        .asciz    "String_charAt(s2,4) = \'"
szStartsWith1:   .asciz    "String_startsWith_1(s1,11,\"hat.\") = "
szStartsWith2:   .asciz    "String_startsWith_2(s1,\"Cat\") = "
szEndsWith:      .asciz    "String_endsWith(s1,\"in the hat.\") = "
szIndex1:        .asciz    "String_indexOf_1(s2,\'g\') = "
szIndex2:        .asciz    "String_indexOf_2(s2,\'g\',9) = "
szIndex3:        .asciz    "String_indexOf_3(s2,\"eggs\") = "
szLastIndex1:    .asciz    "String_lastIndexOf_1(s2,\'g\') = "
szLastIndex2:    .asciz    "String_lastIndexOf_2(s2,\'g\',6) = "
szLastIndex3:    .asciz    "String_lastIndexOf_3(s2,\"egg\") = "
szReplace:       .asciz    "String_replace(s1,\'a\',\'o\') = \""
szLower:         .asciz    "String_toLowerCase(s1) = \""
szUpper:         .asciz    "String_toUpperCase(s1) = \""
szConcat:        .asciz    "String_concat(s1, s2) = \""  //I manually added a space

szStarts1:       .asciz   "hat."
szStarts2:       .asciz   "Cat"
szEnds:          .asciz   "in the hat."
szInt:           .skip 21
szQuote:         .asciz "\""
szSingle:        .asciz "\'"
szTrue:          .asciz "TRUE\n"
szFalse:         .asciz "FALSE\n"
chCr:            .byte 10

//Alan stuff
arg_13: .byte 'g'   
szResult: .space 21 //holds string conversions and outputs them; for all indexs
s1b: .asciz "Cot in the hot"
s1c: .asciz "Cot in the hot"
s2b:              .asciz   "Green eggs and ham."
szSpace: .asciz " "
szEggs: .asciz "eggs"

arg_17a: .byte 'a'
arg_17b: .byte 'b'




