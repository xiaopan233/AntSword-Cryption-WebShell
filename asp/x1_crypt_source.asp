<%@ Language = "VBscript" %>
<%
Class clsRSA 
' This is a crypt algorithm source file.If you are interested in how it work.Read this code
' 本文件为加密算法的源文件，如果想学习下如何对字符串进行加密的可以看看这个源码
    Public PrivateKey 
    Public PublicKey
    Public Modulus 

    Public Sub GenKey()
        Dim lLngPhi 
        Dim q 
        Dim p 

        Randomize 

        Do 
            Do 

                ' 2 random primary numbers (0 to 1000) 
                Do 
                    p = Rnd * 1000 \ 1 
                Loop While Not IsPrime(p) 

                Do 
                    q = Rnd * 1000 \ 1 
                Loop While Not IsPrime(q) 

                ' n = product of 2 primes 

                Modulus = p * q \ 1 

                ' random decryptor (2 to n) 
                PrivateKey = Rnd * (Modulus - 2) \ 1 + 2 

                lLngPhi = (p - 1) * (q - 1) \ 1 
                PublicKey = Euler(lLngPhi, PrivateKey) 

            Loop While PublicKey = 0 Or PublicKey = 1 

        ' Loop if we can't crypt/decrypt a byte     
        Loop While Not TestCrypt(255) 

    End Sub 

    Private Function TestCrypt(ByRef pBytData) 
        Dim lStrCrypted 
        lStrCrypted = Crypt(pBytData, PublicKey) 

        TestCrypt = Crypt(lStrCrypted, PrivateKey) = pBytData 

        TestCrypt = Crypt(lStrCrypted, PrivateKey) = pBytData 

    End Function 

    Private Function Euler(ByRef pLngPHI, ByRef pLngKey) 

        Dim lLngR(3) 
        Dim lLngP(3) 
        Dim lLngQ(3) 

        Dim lLngCounter 
        Dim lLngResult 

        Euler = 0 

        lLngR(1) = pLngPHI: lLngR(0) = pLngKey 
        lLngP(1) = 0: lLngP(0) = 1 
        lLngQ(1) = 2: lLngQ(0) = 0 

        lLngCounter = -1 

        Do Until lLngR(0) = 0 

            lLngR(2) = lLngR(1): lLngR(1) = lLngR(0) 
            lLngP(2) = lLngP(1): lLngP(1) = lLngP(0) 
            lLngQ(2) = lLngQ(1): lLngQ(1) = lLngQ(0) 

            lLngCounter = lLngCounter + 1 

            lLngR(0) = lLngR(2) Mod lLngR(1) 
            lLngP(0) = ((lLngR(2)\lLngR(1)) * lLngP(1)) + lLngP(2) 
            lLngQ(0) = ((lLngR(2)\lLngR(1)) * lLngQ(1)) + lLngQ(2) 

        Loop 

        lLngResult = (pLngKey * lLngP(1)) - (pLngPHI * lLngQ(1)) 

        If lLngResult > 0 Then 
            Euler = lLngP(1) 
        Else 
            Euler = Abs(lLngP(1)) + pLngPHI 
        End If 

    End Function 

    Public Function Crypt(pLngMessage, pLngKey) 
        On Error Resume Next 
        Dim lLngMod 
        Dim lLngResult 
        Dim lLngIndex 
        If pLngKey Mod 2 = 0 Then 
            lLngResult = 1 
            For lLngIndex = 1 To pLngKey / 2 
                lLngMod = (pLngMessage ^ 2) Mod Modulus 
                ' Mod may error on key generation 
                lLngResult = (lLngMod * lLngResult) Mod Modulus  
                If Err Then Exit Function 
            Next 
        Else 
            lLngResult = pLngMessage 
            For lLngIndex = 1 To pLngKey / 2 
                lLngMod = (pLngMessage ^ 2) Mod Modulus 
                On Error Resume Next 
                ' Mod may error on key generation 
                lLngResult = (lLngMod * lLngResult) Mod Modulus 

                If Err Then Exit Function 
            Next 
        End If 
        Crypt = lLngResult 
    End Function 

    Private Function IsPrime(ByRef pLngNumber) 
        Dim lLngSquare 
        Dim lLngIndex 
        IsPrime = False 
        If pLngNumber < 2 Then Exit Function 
        If pLngNumber Mod 2 = 0 Then Exit Function 
        lLngSquare = Sqr(pLngNumber) 
        For lLngIndex = 3 To lLngSquare Step 2 
            If pLngNumber Mod lLngIndex = 0 Then Exit Function 
        Next 
        IsPrime = True 
    End Function 

    Public Function Encode(ByVal pStrMessage) 
        Dim lLngIndex 
        Dim lLngMaxIndex 
        Dim lBytAscii 
        Dim lLngEncrypted 
        lLngMaxIndex = Len(pStrMessage) 
        If lLngMaxIndex = 0 Then Exit Function 
        For lLngIndex = 1 To lLngMaxIndex 
            lBytAscii = Asc(Mid(pStrMessage, lLngIndex, 1)) 
            lLngEncrypted = Crypt(lBytAscii, PublicKey) 
            Encode = Encode & NumberToHex(lLngEncrypted, 4) 
        Next 
    End Function 

    Public Function Decode(ByVal pStrMessage) 
        Dim lBytAscii 
        Dim lLngIndex 
        Dim lLngMaxIndex 
        Dim lLngEncryptedData 
        Decode = "" 
        lLngMaxIndex = Len(pStrMessage) 
        For lLngIndex = 1 To lLngMaxIndex Step 4 
            lLngEncryptedData = HexToNumber(Mid(pStrMessage, lLngIndex, 4)) 
            lBytAscii = Crypt(lLngEncryptedData, PrivateKey) 
            Decode = Decode & Chr(lBytAscii) 
        Next 
    End Function 

    Private Function NumberToHex(ByRef pLngNumber, ByRef pLngLength) 
        NumberToHex = Right(String(pLngLength, "0") & Hex(pLngNumber), pLngLength) 
    End Function 

    Private Function HexToNumber(ByRef pStrHex) 
        HexToNumber = CLng("&h" & pStrHex) 
    End Function 

End Class

Set ObjRSA = New clsRSA
Call ObjRSA.GenKey()
LngKeyE = ObjRSA.PublicKey
LngKeyD = ObjRSA.PrivateKey 
LngKeyN = ObjRSA.Modulus 
response.write("PublicKey is "&LngKeyE&"</br>")
response.write("PrivateKey is "&LngKeyD&"</br>")
response.write("Modulus is "&LngKeyN&"</br>")

StrMessage = "testwhoami?"
StrMessage = ObjRSA.Encode(StrMessage)
response.write(StrMessage&"</br>")
StrMessage = ObjRSA.Decode(StrMessage)
response.write(StrMessage&"</br>")
%>