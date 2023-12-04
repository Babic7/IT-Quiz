####################################
<#
    Wer wird IT-Millionär?
    IT-Qiuz spiel
    Das Folgende Script ist ein IT-Quiz-Spiel im Stil von Wer Wird Millionär 
    Es gibt 15 Fragestufen und das Ziel ist es die 1.000.000€ zu gewinnen.
    Dazu kann man zwei Joker verwenden, die einmal 2 Falsche Antworten entfernen (50:50 Joker)
    und einmal eine falsche Antwort entfernt (75:25 Joker)
    
    Script verfasst von: Dominik Babic
    Geschrieben am: 20.10.2023
#>
####################################


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

###### Funktionen für das Script

# Antwort-Checkbox erstellen
function New-CheckBox {
    param (
        [int]$X,
        [int]$Y,
        [string]$Text
    )

    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Location = New-Object System.Drawing.Point($X, $Y)
    $checkbox.Size = New-Object System.Drawing.Size (370, 80)
    $checkbox.Text = $Text
    $checkbox.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)

    return $checkbox
}

# Funktion Button erstellen
function New-Button{
    [CmdLetBinding()]
    PARAM(
        [String]$buttontext
    )

    $submitButton = New-Object System.Windows.Forms.Button
    $submitButton.Location = New-Object System.Drawing.Size (1000, 618)
    $submitButton.Size = New-Object System.Drawing.Size(170, 50)
    $submitButton.font = New-Object System.Drawing.Font ("Arial", 14, [System.Drawing.Fontstyle]::Bold)
    $submitButton.text = $buttontext

    return $submitButton
}

<# 
    Funktion für den 50:50 Joker
    Die Funktion erwartet einen Parameter $currentQuestion, der die aktuelle Frage repräsentiert, die der Spieler beantwortet.
    Basierend auf der übergebenen Frage (identifiziert durch $currentQuestion), werden die richtige Antwort ($correctAnswer), 
    alle Antworten ($allAnswers) und die falschen Antworten ($wrongAnswers) ausgewählt. 
    Am Ende werden zwei Antworten aus ($wrongAnswers) aus gewählt und gelöscht.
#>
function Activate5050Joker {
    
    param (
        [INT]$currentQuestion
    )

    if($currentQuestion -eq 0){

        $correctAnswer = $zufälligeFrage50.RichtigeAntwort
        $allAnswers = $zufälligeFrage50.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 1){

        $correctAnswer = $zufälligeFrage100.RichtigeAntwort
        $allAnswers = $zufälligeFrage100.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }    
    elseif($currentQuestion -eq 2){

        $correctAnswer = $zufälligeFrage200.RichtigeAntwort
        $allAnswers = $zufälligeFrage200.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }    
    elseif($currentQuestion -eq 3){

        $correctAnswer = $zufälligeFrage300.RichtigeAntwort
        $allAnswers = $zufälligeFrage300.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    } 
    elseif($currentQuestion -eq 4){

        $correctAnswer = $zufälligeFrage500.RichtigeAntwort
        $allAnswers = $zufälligeFrage500.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 5){

        $correctAnswer = $zufälligeFrage1000.RichtigeAntwort
        $allAnswers = $zufälligeFrage1000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 6){

        $correctAnswer = $zufälligeFrage2000.RichtigeAntwort
        $allAnswers = $zufälligeFrage2000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 7){

        $correctAnswer = $zufälligeFrage4000.RichtigeAntwort
        $allAnswers = $zufälligeFrage4000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 8){

        $correctAnswer = $zufälligeFrage8000.RichtigeAntwort
        $allAnswers = $zufälligeFrage8000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }  
    elseif($currentQuestion -eq 9){

        $correctAnswer = $zufälligeFrage16000.RichtigeAntwort
        $allAnswers = $zufälligeFrage16000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 10){

        $correctAnswer = $zufälligeFrage32000.RichtigeAntwort
        $allAnswers = $zufälligeFrage32000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 11){

        $correctAnswer = $zufälligeFrage64000.RichtigeAntwort
        $allAnswers = $zufälligeFrage64000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 12){

        $correctAnswer = $zufälligeFrage125000.RichtigeAntwort
        $allAnswers = $zufälligeFrage125000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 13){

        $correctAnswer = $zufälligeFrage500000.RichtigeAntwort
        $allAnswers = $zufälligeFrage500000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    } 
    elseif($currentQuestion -eq 14){

        $correctAnswer = $zufälligeFrage1000000.RichtigeAntwort
        $allAnswers = $zufälligeFrage1000000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }                      

  
    # Zufällige Auswahl von zwei falschen Antworten
    $answersToRemove = Get-Random -Count 2 -InputObject $wrongAnswers

    # Entferne die ausgewählten falschen Antworten aus dem Array
    $answersToKeep = $allAnswers | Where-Object { $_ -notin $answersToRemove }

    # Deaktiviere die Joker-Schaltfläche, nachdem sie verwendet wurde
    $joker5050Button.Enabled = $false

    # Erstelle ein Array für die Checkboxes
    

    $checkboxes = $checkbox1, $checkbox2, $checkbox3, $checkbox4

    foreach($checkbox in $checkboxes) {
        if ($checkbox.Text -in $answersToRemove) {
            $checkbox.Text = ""
            $checkbox.Checked = $false
        } 
    }
}

<# 
    Funktion für den 75:25 Joker
    Die Funktion erwartet einen Parameter $currentQuestion, der die aktuelle Frage repräsentiert, die der Spieler beantwortet.
    Basierend auf der übergebenen Frage (identifiziert durch $currentQuestion), werden die richtige Antwort ($correctAnswer), 
    alle Antworten ($allAnswers) und die falschen Antworten ($wrongAnswers) ausgewählt. 
    Am Ende wird eine Antworten aus ($wrongAnswers) aus gewählt und gelöscht.
#>
function Activate7525Joker {
    
    param (
        [INT]$currentQuestion
    )

    if($currentQuestion -eq 0){

        $correctAnswer = $zufälligeFrage50.RichtigeAntwort
        $allAnswers = $zufälligeFrage50.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 1){

        $correctAnswer = $zufälligeFrage100.RichtigeAntwort
        $allAnswers = $zufälligeFrage100.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }    
    elseif($currentQuestion -eq 2){

        $correctAnswer = $zufälligeFrage200.RichtigeAntwort
        $allAnswers = $zufälligeFrage200.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }    
    elseif($currentQuestion -eq 3){

        $correctAnswer = $zufälligeFrage300.RichtigeAntwort
        $allAnswers = $zufälligeFrage300.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    } 
    elseif($currentQuestion -eq 4){

        $correctAnswer = $zufälligeFrage500.RichtigeAntwort
        $allAnswers = $zufälligeFrage500.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 5){

        $correctAnswer = $zufälligeFrage1000.RichtigeAntwort
        $allAnswers = $zufälligeFrage1000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 6){

        $correctAnswer = $zufälligeFrage2000.RichtigeAntwort
        $allAnswers = $zufälligeFrage2000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 7){

        $correctAnswer = $zufälligeFrage4000.RichtigeAntwort
        $allAnswers = $zufälligeFrage4000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 8){

        $correctAnswer = $zufälligeFrage8000.RichtigeAntwort
        $allAnswers = $zufälligeFrage8000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }  
    elseif($currentQuestion -eq 9){

        $correctAnswer = $zufälligeFrage16000.RichtigeAntwort
        $allAnswers = $zufälligeFrage16000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 10){

        $correctAnswer = $zufälligeFrage32000.RichtigeAntwort
        $allAnswers = $zufälligeFrage32000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 11){

        $correctAnswer = $zufälligeFrage64000.RichtigeAntwort
        $allAnswers = $zufälligeFrage64000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 12){

        $correctAnswer = $zufälligeFrage125000.RichtigeAntwort
        $allAnswers = $zufälligeFrage125000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }
    elseif($currentQuestion -eq 13){

        $correctAnswer = $zufälligeFrage500000.RichtigeAntwort
        $allAnswers = $zufälligeFrage500000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    } 
    elseif($currentQuestion -eq 14){

        $correctAnswer = $zufälligeFrage1000000.RichtigeAntwort
        $allAnswers = $zufälligeFrage1000000.Antworten
        $wrongAnswers = $allAnswers | Where-Object { $_ -ne $correctAnswer }
    }                      
   
    # Zufällige Auswahl von zwei falschen Antworten
    $answersToRemove = Get-Random -Count 1 -InputObject $wrongAnswers

    # Entferne die ausgewählten falschen Antworten aus dem Array
    $answersToKeep = $allAnswers | Where-Object { $_ -notin $answersToRemove }

    # Deaktiviere die Joker-Schaltfläche, nachdem sie verwendet wurde
    $joker7525Button.Enabled = $false

    # Erstelle ein Array für die Checkboxes
    

    $checkboxes = $checkbox1, $checkbox2, $checkbox3, $checkbox4

    foreach($checkbox in $checkboxes) {
        if ($checkbox.Text -in $answersToRemove) {
            $checkbox.Text = ""
            $checkbox.Checked = $false
        } 
    }
}

# allgemeine Funktion, die sicherstellt, dass nur die angeklickte Checkbox ausgewählt ist.
function SetSingleCheckbox($currentCheckbox, $allCheckboxes) {
    foreach ($checkbox in $allCheckboxes) {
        if ($checkbox -ne $currentCheckbox) {
            $checkbox.Checked = $false
        }
    }
}

function Log-SpielErgebnis {
    param (
        [string] $Spielername,
        [INT]$currentQuestion
    )

    if ($currentQuestion -eq 0) {
            $Gewinn = 0
    }
    elseif ($currentQuestion -eq 1){
            $Gewinn = 50
    }
    elseif ($currentQuestion -eq 2){
            $Gewinn = 100
    }
    elseif ($currentQuestion -eq 3){
            $Gewinn = 200
    }
    elseif ($currentQuestion -eq 4){
            $Gewinn = 300
    }
    elseif ($currentQuestion -eq 5){
            $Gewinn = 500
    }
    elseif ($currentQuestion -eq 6){
            $Gewinn = 1000
    }
    elseif ($currentQuestion -eq 7){
            $Gewinn = 2000
    }
    elseif ($currentQuestion -eq 8){
            $Gewinn = 4000
    }
    elseif ($currentQuestion -eq 9){
            $Gewinn = 8000
    }
    elseif ($currentQuestion -eq 10){
            $Gewinn = 16000
    }
    elseif ($currentQuestion -eq 11){
            $Gewinn = 32000
    }
    elseif ($currentQuestion -eq 12){
            $Gewinn = 64000
    }
    elseif ($currentQuestion -eq 13){
            $Gewinn = 125000
    }
    elseif ($currentQuestion -eq 14){
            $Gewinn = 500000
    }
    elseif ($currentQuestion -eq 15){
            $Gewinn = 1000000
    }

    
    $Datum = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    $LogText = "Spieler: $Spielername | Datum: $Datum | Gewinn: $Gewinn€"
   

    # Füge den Logtext am Ende der Datei hinzu
    Add-Content -Path $logfilePath -Value $LogText
}


# Aktuelle Frage-Index initialisieren
$counter = 0

# Pfad zur Bilddatei
$bildpfad = "C:\powershell\IT-Quiz\img\wwm.png"
$bildpfad2 = "C:\powershell\IT-Quiz\img\wwm-spiel.jpg"

# Pfad zur Logdatei
$logfilePath = "C:\powershell\IT-Quiz\Highscore.log"

# Laden der Bilder in eine Variable
$bild = [System.Drawing.Image]::FromFile($bildpfad)
$bild2 = [System.Drawing.Image]::FromFile($bildpfad2)

Add-Type -AssemblyName presentationCore

# Pfad zur .mp3-Audiodatei
$intro = "C:\powershell\IT-Quiz\mp3\intro.mp3"
$5050 = "C:\powershell\IT-Quiz\mp3\5050.mp3"
$gamestart = "C:\powershell\IT-Quiz\mp3\gamestart.mp3"
$lose = "C:\powershell\IT-Quiz\mp3\Lose.mp3"
$win = "C:\powershell\IT-Quiz\mp3\Win.mp3"
$1000000lose = "C:\powershell\IT-Quiz\mp3\1000000lose.mp3"
$1000000win = "C:\powershell\IT-Quiz\mp3\1000000win.mp3"
$1000000question = "C:\powershell\IT-Quiz\mp3\1000000Question.mp3"
$100_1000question = "C:\powershell\IT-Quiz\mp3\100-1000questions.mp3"
$2000question = "C:\powershell\IT-Quiz\mp3\2000question.mp3"
$4000question = "C:\powershell\IT-Quiz\mp3\4000question.mp3"
$8000question = "C:\powershell\IT-Quiz\mp3\8000question.mp3"
$16000question = "C:\powershell\IT-Quiz\mp3\16000question.mp3"
$32000question = "C:\powershell\IT-Quiz\mp3\32000question.mp3"
$64000question = "C:\powershell\IT-Quiz\mp3\64000question.mp3"
$125000question = "C:\powershell\IT-Quiz\mp3\125000question.mp3"
$500000question = "C:\powershell\IT-Quiz\mp3\500000question.mp3"


$mediaplayer = New-Object System.Windows.Media.MediaPlayer

$mediaplayer.Open($intro)

$mediaplayer.Play()

# Start-Fenster erstellen
$Form = New-Object System.Windows.Forms.Form
$Form.StartPosition = "CenterScreen"
$Form.Size = New-Object System.Drawing.Size (1024, 560)
$Form.Text = "IT-Quiz"
$Form.TopMost = $true
$Form.BackgroundImage = $bild

# Fragen und Antworten werden in verschieden Arrays gespeichert je nach Frage/-Gewinnstufe
$fragenUndAntworten50 = @(
    @{
        Frage = "50€ Frage: Wofür steht 'CPU'?"
        Antworten = @("A: Cyber physical Unit", "B: Computer Performance Utility", "C: Central Processing Unit", "D: Computer Processing Unit")
        RichtigeAntwort = "C: Central Processing Unit"
    },
    @{
        Frage = "50€ Frage: Welche von diesen ist ein Betriebssystem?"
        Antworten = @("A: Microsoft Office", "B: Windows 10", "C: Microsoft Word", "D: Microsoft Excel")
        RichtigeAntwort = "B: Windows 10"
    },
    @{
        Frage = "50€ Frage: Wie viele Bits entsprechen einem Byte?"
        Antworten = @("A: 4 Bits", "B: 8 Bits", "C: 16 Bits", "D: 32 Bits")
        RichtigeAntwort = "B: 8 Bits"
    }
)

$fragenUndAntworten100 = @(
    @{
        Frage = "100€ Frage: Welche Taste wird oft als 'Enter' bezeichnet?"
        Antworten = @("A: Leertaste", "B: Esc-Taste", "C: Return-Taste", "D: Tab-Taste")
        RichtigeAntwort = "C: Return-Taste"
    },
    @{
        Frage = "100€ Frage: Welches Dateiformat wird häufig für Bilder verwendet?"
        Antworten = @("A: .pdf", "B: .txt", "C: .jpg", "D: .exe")
        RichtigeAntwort = "C: .jpg"
    },
    @{
        Frage = "100€ Frage: Welche Firma entwickelte das Betriebssystem 'iOS'?"
        Antworten = @("A: Google", "B: Microsoft", "C: Apple", "D: Samsung")
        RichtigeAntwort = "C: Apple"
    }
)

$fragenUndAntworten200 = @(
    @{
        Frage = "200€ Frage: Was ist ein 'URL'?"
        Antworten = @("A: Universal Resource Locator", "B: Uniform Resource Link", "C: Universal Router Locator", "D: Uniform Resource Locator")
        RichtigeAntwort = "A: Universal Resource Locator"
    },
    @{
        Frage = "200€ Frage: Welches Protokoll wird für den sicheren Datentransport `nim Internet verwendet?"
        Antworten = @("A: FTP", "B: HTTP", "C: TCP", "D: HTTPS")
        RichtigeAntwort = "D: HTTPS"
    },
    @{
        Frage = "200€ Frage:`nWelche Programmiersprache wurde von Guido van Rossum entwickelt?"
        Antworten = @("A: JavaScript", "B: Python", "C: Java", "D: Ruby")
        RichtigeAntwort = "B: Python"
    }
)

$fragenUndAntworten300 = @(
    @{
        Frage = "300€ Frage: Welcher Begriff beschreibt die Fähigkeit eines Systems, `nmenschliche Sprache zu verstehen und zu verarbeiten?"
        Antworten = @("A: KI", "B: API", "C: BIOS", "D: GUI")
        RichtigeAntwort = "A: KI"
    },
    @{
        Frage = "300€ Frage: Welches Datenbankmanagementsystem ist bekannt`n für seine Verwendung von SQL?"
        Antworten = @("A: MongoDB", "B: Oracle", "C: Redis", "D: Cassandra")
        RichtigeAntwort = "B: Oracle"
    },
    @{
        Frage = "300€ Frage: Welcher Algorithmus wird in der Kryptographie`n für die Verschlüsselung und Entschlüsselung verwendet?"
        Antworten = @("A: SHA-256", "B: RSA", "C: HTTP", "D: FTP")
        RichtigeAntwort = "B: RSA"
    }
)

$fragenUndAntworten500 = @(
    @{
        Frage = "500€ Frage:`nWelches Protokoll wird zur elektronischen Übermittlung von E-Mails verwendet?"
        Antworten = @("A: HTTP", "B: FTP", "C: SMTP", "D: TCP")
        RichtigeAntwort = "C: SMTP"
    },
    @{
        Frage = "500€ Frage: Welche Programmiersprache ist bekannt `nfür ihre Verwendung in Webentwicklung und -design?"
        Antworten = @("A: Java", "B: C++", "C: HTML", "D: PHP")
        RichtigeAntwort = "C: HTML"
    },
    @{
        Frage = "500€ Frage:`nWelches Unternehmen entwickelte das Betriebssystem 'Linux'?"
        Antworten = @("A: Microsoft", "B: Apple", "C: IBM", "D: Linus Torvalds")
        RichtigeAntwort = "D: Linus Torvalds"
    }
)

$fragenUndAntworten1000 = @(
    @{
        Frage = "1000€ Frage: Welche der folgenden ist eine bekannte Versionskontrollsoftware?"
        Antworten = @("A: Word", "B: Photoshop", "C: Git", "D: Excel")
        RichtigeAntwort = "C: Git"
    },
    @{
        Frage = "1000€ Frage: Was ist ein häufig verwendetes Datenübertragungsprotokoll `nim Internet, das für die Anzeige von Webseiten verwendet wird?"
        Antworten = @("A: FTP", "B: HTTP", "C: SMTP", "D: JSON")
        RichtigeAntwort = "B: HTTP"
    },
    @{
        Frage = "1000€ Frage: Welche der folgenden ist eine`n objektorientierte Programmiersprache?"
        Antworten = @("A: Fortran", "B: Pascal", "C: C#", "D: Assembly")
        RichtigeAntwort = "C: C#"
    }
)

$fragenUndAntworten2000 = @(
    @{
        Frage = "2000€ Frage: Welche der folgenden Technologien wird häufig `nfür die Entwicklung von mobilen Anwendungen verwendet?"
        Antworten = @("A: PHP", "B: Swift", "C: COBOL", "D: MATLAB")
        RichtigeAntwort = "B: Swift"
    },
    @{
        Frage = "2000€ Frage: Welche der folgenden Programmiersprachen wird oft `nfür maschinelles Lernen und künstliche Intelligenz verwendet?"
        Antworten = @("A: Ruby", "B: Python", "C: Perl", "D: Rust")
        RichtigeAntwort = "B: Python"
    },
    @{
        Frage = "2000€ Frage: Welche der folgenden ist eine Datenbankmanagementsystemsoftware?"
        Antworten = @("A: Photoshop", "B: MySQL", "C: Excel", "D: Word")
        RichtigeAntwort = "B: MySQL"
    }
)

$fragenUndAntworten4000 = @(
    @{
        Frage = "4000€ Frage: Welche der folgenden ist ein gängiges Betriebssystem`n für mobile Geräte?"
        Antworten = @("A: Linux", "B: Android", "C: Windows", "D: MacOS")
        RichtigeAntwort = "B: Android"
    },
    @{
        Frage = "4000€ Frage: Welche der folgenden Programmiersprachen ist besonders gut `nfür die Entwicklung von Webanwendungen geeignet?"
        Antworten = @("A: COBOL", "B: Ruby", "C: Java", "D: JavaScript")
        RichtigeAntwort = "D: JavaScript"
    },
    @{
        Frage = "4000€ Frage: Welche der folgenden ist ein gängiger Webbrowser?"
        Antworten = @("A: Photoshop", "B: Safari", "C: Excel", "D: Word")
        RichtigeAntwort = "B: Safari"
    }
)

$fragenUndAntworten8000 = @(
    @{
        Frage = "8000€ Frage: Welche Programmiersprache wurde von Microsoft entwickelt und `nist besonders für Windows-Anwendungen geeignet?"
        Antworten = @("A: Python", "B: Java", "C: C#", "D: Ruby")
        RichtigeAntwort = "C: C#"
    },
    @{
        Frage = "8000€ Frage: Welcher IT-Begriff steht für den Prozess der Umwandlung `nvon menschlich lesbarem Code in Maschinencode?"
        Antworten = @("A: Kompilieren", "B: Komprimieren", "C: Codieren", "D: Scripting")
        RichtigeAntwort = "A: Kompilieren"
    },
    @{
        Frage = "8000€ Frage: Welcher Suchmaschinenanbieter betreibt auch `nein beliebtes Betriebssystem für mobile Geräte?"
        Antworten = @("A: Microsoft", "B: Apple", "C: Google", "D: Samsung")
        RichtigeAntwort = "C: Google"
    }
)

$fragenUndAntworten16000 = @(
    @{
        Frage = "16000€ Frage: Welche der folgenden Technologien ermöglicht es, `nWebsites für verschiedene Bildschirmgrößen und Gerätetypen zu optimieren?"
        Antworten = @("A: HTML", "B: CSS", "C: JavaScript", "D: Responsive Design")
        RichtigeAntwort = "D: Responsive Design"
    },
    @{
        Frage = "16000€ Frage: Welche der folgenden Programmiersprachen wird häufig `nfür die Entwicklung von Videospielen verwendet?"
        Antworten = @("A: Python", "B: C++", "C: Java", "D: Ruby")
        RichtigeAntwort = "B: C++"
    },
    @{
        Frage = "16000€ Frage:`nWelches der folgenden Unternehmen entwickelte das Betriebssystem 'macOS'?"
        Antworten = @("A: Microsoft", "B: Apple", "C: IBM", "D: Linus Torvalds")
        RichtigeAntwort = "B: Apple"
    }
)

$fragenUndAntworten32000 = @(
    @{
        Frage = "32000€ Frage: Was ist ein 'Algorithmus' in der Informatik?"
        Antworten = @("A: Ein spezielles Computergerät", "B: Ein Fachbegriff für Computerprogramme", "C: Eine systematische Anleitung zur Lösung eines Problems", "D: Ein technisches Bauteil in Computern")
        RichtigeAntwort = "C: Eine systematische Anleitung zur Lösung eines Problems"
    },
    @{
        Frage = "32000€ Frage: Welche der folgenden Datenstrukturen wird häufig verwendet, `num Daten in einer geordneten Liste zu speichern?"
        Antworten = @("A: Array", "B: Schlüssel-Wert-Paar", "C: Schlange", "D: Baum")
        RichtigeAntwort = "A: Array"
    },
    @{
        Frage = "32000€ Frage: Welches der folgenden Protokolle wird oft für die `ndrahtlose Kommunikation in lokalen Netzwerken verwendet?"
        Antworten = @("A: HTTP", "B: Bluetooth", "C: USB", "D: Ethernet")
        RichtigeAntwort = "B: Bluetooth"
    }
)

$fragenUndAntworten64000 = @(
    @{
        Frage = "64000€ Frage: Welches Verschlüsselungsverfahren wird in der heutigen Zeit`n als unsicher und veraltet angesehen und sollte vermieden werden?"
        Antworten = @("A: RSA", "B: DES", "C: AES", "D: SHA-256")
        RichtigeAntwort = "B: DES"
    },
    @{
        Frage = "64000€ Frage: Was ist 'Quantencomputing' und wie unterscheidet es sich von klassischem Computing?"
        Antworten = @("A: Quantencomputer verwenden Quantenbits statt klassischer Bits und können komplexe Berechnungen schneller durchführen.", "B: Quantencomputer verwenden klassische Bits, aber arbeiten mit einem besonders leistungsstarken Algorithmus.", "C: Quantencomputer sind genauso leistungsfähig wie klassische Computer, aber sie sind viel kleiner.", "D: Quantencomputer sind besonders sicher gegen Angriffe von außen.")
        RichtigeAntwort = "A: Quantencomputer verwenden Quantenbits statt klassischer Bits und können komplexe Berechnungen schneller durchführen."
    },
    @{
        Frage = "64000€ Frage: Welches Protokoll wird häufig für die Verschlüsselung `nvon Internetverbindungen und den Schutz von Datenübertragungen verwendet?"
        Antworten = @("A: HTTP", "B: SMTP", "C: SSL/TLS", "D: UDP")
        RichtigeAntwort = "C: SSL/TLS"
    }
)

$fragenUndAntworten125000 = @(
    @{
        Frage = "125000€ Frage:`nWas versteht man unter 'Zero-Day-Exploit' im Bereich der IT-Sicherheit?"
        Antworten = @("A: Ein Exploit, der nur an nullten Tagen eines Monats funktioniert.", "B: Ein Exploit, der am ersten Tag eines Software-Updates funktioniert.", "C: Ein Exploit, der noch nicht öffentlich bekannt ist und daher noch nicht gepatcht wurde.", "D: Ein Exploit, der speziell für den Einsatz in Sicherheitssoftware entwickelt wurde.")
        RichtigeAntwort = "C: Ein Exploit, der noch nicht öffentlich bekannt ist und daher noch nicht gepatcht wurde."
    },
    @{
        Frage = "125000€ Frage: Welche Technologie ermöglicht es,`nInformationen zwischen Smartphones und anderen Geräten `nin unmittelbarer Nähe drahtlos auszutauschen?"
        Antworten = @("A: 4G", "B: Wi-Fi", "C: NFC", "D: Bluetooth")
        RichtigeAntwort = "C: NFC"
    },
    @{
        Frage = "125000€ Frage: Welches Verschlüsselungsverfahren wird häufig `nfür die sichere Übertragung von E-Mails verwendet und ist bekannt für seine starke Sicherheit?"
        Antworten = @("A: ROT13", "B: PGP", "C: Vigenère-Chiffre", "D: Caesar-Chiffre")
        RichtigeAntwort = "B: PGP"
    }
)

$fragenUndAntworten500000 = @(
    @{
        Frage = "500000€ Frage: Welches bekannte Betriebssystem basiert auf `neinem Unix-artigen Systemkern und ist weit verbreitet in der Serververwaltung?"
        Antworten = @("A: Windows", "B: macOS", "C: Linux", "D: Solaris")
        RichtigeAntwort = "C: Linux"
    },
    @{
        Frage = "500000€ Frage: Welches mathematische Problem bildet die Grundlage `nfür viele moderne Verschlüsselungsverfahren und ist schwer zu lösen?"
        Antworten = @("A: Primfaktorzerlegung", "B: Quadratische Gleichungen", "C: Integralrechnung", "D: Dreiecksgeometrie")
        RichtigeAntwort = "A: Primfaktorzerlegung"
    },
    @{
        Frage = "500000€ Frage: Was ist ein 'Pentest' im Bereich der IT-Sicherheit?"
        Antworten = @("A: Eine Software, um Passwörter zu knacken", "B: Ein Test, um die Leistung eines Computers zu überprüfen", "C: Eine Simulation von Hackerangriffen, um Schwachstellen zu identifizieren", "D: Eine Methode zur Datenrettung von beschädigten Festplatten")
        RichtigeAntwort = "C: Eine Simulation von Hackerangriffen, um Schwachstellen zu identifizieren"
    }
)

$fragenUndAntworten1000000 = @(
    @{
        Frage = "1000000€ Frage: `nWelcher Pionier der theoretischen Informatik und Künstlichen Intelligenz`n formulierte das 'Halteproblem', `ndas die Grenzen algorithmischer Berechenbarkeit definiert?"
        Antworten = @("A: Alan Turing", "B: John von Neumann", "C: Claude Shannon", "D: Grace Hopper")
        RichtigeAntwort = "A: Alan Turing"
    },
    @{
        Frage = "1000000€ Frage:`nWelcher Mathematiker und Kryptologe entwickelte im Zweiten Weltkrieg `nden ersten funktionsfähigen Digitalcomputer `nund wird oft als Vater des Computers bezeichnet?"
        Antworten = @("A: Alan Turing", "B: John von Neumann", "C: Claude Shannon", "D: Grace Hopper")
        RichtigeAntwort = "A: Alan Turing"
    },
    @{
        Frage = "1000000€ Frage:`n Welches komplexe mathematische Problem wurde 2000 vom Clay Mathematics`n Institute als eines der sieben Millennium-Preisprobleme ausgelobt,`n für dessen Lösung ein Preis von einer Million Dollar ausgelobt wurde?"
        Antworten = @("A: Die P-NP-Frage", "B: Das Riemannsche Vermutung", "C: Das Goldbachsche Vermutung", "D: Die Vermutung von Birch und Swinnerton-Dyer")
        RichtigeAntwort = "A: Die P-NP-Frage"
    }
)

# Zufällige Auswahl einer 50€ Frage
$zufälligeFrage50 = Get-Random $fragenUndAntworten50
# Zufällige Auswahl einer 100€ Frage
$zufälligeFrage100 = Get-Random $fragenUndAntworten100
# Zufällige Auswahl einer 200€ Frage
$zufälligeFrage200 = Get-Random $fragenUndAntworten200
# Zufällige Auswahl einer 300€ Frage
$zufälligeFrage300 = Get-Random $fragenUndAntworten300
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage500 = Get-Random $fragenUndAntworten500
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage1000 = Get-Random $fragenUndAntworten1000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage2000 = Get-Random $fragenUndAntworten2000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage4000 = Get-Random $fragenUndAntworten4000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage8000 = Get-Random $fragenUndAntworten8000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage16000 = Get-Random $fragenUndAntworten16000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage32000 = Get-Random $fragenUndAntworten32000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage64000 = Get-Random $fragenUndAntworten64000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage125000 = Get-Random $fragenUndAntworten125000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage500000 = Get-Random $fragenUndAntworten500000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage500000 = Get-Random $fragenUndAntworten500000
# Zufällige Auswahl einer 500€ Frage
$zufälligeFrage1000000 = Get-Random $fragenUndAntworten1000000

# Label erstellen
$questionLabel = New-Object System.Windows.Forms.Label
$questionLabel.Location = New-Object System.Drawing.Size (100, 50)
$questionLabel.Size = New-Object System.Drawing.Size (100, 40)
$questionLabel.AutoSize = $true
$questionLabel.Text = $zufälligeFrage50.Frage
$questionLabel.font = New-Object System.Drawing.Font ("Arial", 14, [System.Drawing.Fontstyle]::Bold)

# Textbox für Spielernamen erstellen
$textbox = New-Object System.Windows.Forms.TextBox
$textbox.Location = New-Object System.Drawing.Size (100, 450)
$textbox.size = New-Object System.Drawing.Size (200, 80)
$textbox.font = New-Object System.Drawing.Font ("Arial", 18, [System.Drawing.Fontstyle]::Bold)
$textbox.Text = "Spielername"
$Form.Controls.Add($textbox)

# Button zum Spiel starten erstellen
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (700, 450)
$button.Size = New-Object System.Drawing.Size 250
$button.Height = 40
$button.font = New-Object System.Drawing.Font ("Arial", 14, [System.Drawing.Fontstyle]::Bold)
$button.text = "IT-Quiz Starten"
$Form.Controls.Add($button)

# Button für den 50:50 Joker erstellen
$joker5050Button = New-Button -buttontext "50:50 Joker"
$joker5050Button.Location = New-Object System.Drawing.Size(1000, 410)
$joker5050Button.Height = 70

# Button für den 75:25 Joker erstellen
$joker7525Button = New-Button -buttontext "75:25 Joker"
$joker7525Button.Location = New-Object System.Drawing.Size(1000, 320)
$joker7525Button.Height = 70

# Button für die Antwortbestätigung erstellen
$submitButton = New-Button -buttontext "Antworten"
$submitButton2 = New-Button -buttontext "Antworten"
$submitButton3 = New-Button -buttontext "Antworten"
$submitButton4 = New-Button -buttontext "Antworten"
$submitButton5 = New-Button -buttontext "Antworten"
$submitButton6 = New-Button -buttontext "Antworten"
$submitButton7 = New-Button -buttontext "Antworten"
$submitButton8 = New-Button -buttontext "Antworten"
$submitButton9 = New-Button -buttontext "Antworten"
$submitButton10 = New-Button -buttontext "Antworten"
$submitButton11 = New-Button -buttontext "Antworten"
$submitButton12 = New-Button -buttontext "Antworten"
$submitButton13 = New-Button -buttontext "Antworten"
$submitButton14 = New-Button -buttontext "Antworten"
$submitButton15 = New-Button -buttontext "Antworten"
$beendenButton = New-Button -buttontext "Beenden"

# Button für die nächste Frage erstellen
$nextButton = New-Button -buttontext "Weiter"
$nextButton2 = New-Button -buttontext "Weiter"
$nextButton3 = New-Button -buttontext "Weiter"
$nextButton4 = New-Button -buttontext "Weiter"
$nextButton5 = New-Button -buttontext "Weiter"
$nextButton6 = New-Button -buttontext "Weiter"
$nextButton7 = New-Button -buttontext "Weiter"
$nextButton8 = New-Button -buttontext "Weiter"
$nextButton9 = New-Button -buttontext "Weiter"
$nextButton10 = New-Button -buttontext "Weiter"
$nextButton11 = New-Button -buttontext "Weiter"
$nextButton12 = New-Button -buttontext "Weiter"
$nextButton13 = New-Button -buttontext "Weiter"
$nextButton14 = New-Button -buttontext "Weiter"
$nextButton15 = New-Button -buttontext "Weiter"


# Erstelle die CheckBoxes und speichere sie in separaten Variablen
$checkbox1 = New-CheckBox -X 100 -Y 500 -Text $zufälligeFrage50.Antworten[0]
$checkbox2 = New-CheckBox -X 100 -Y 600 -Text $zufälligeFrage50.Antworten[1]
$checkbox3 = New-CheckBox -X 530 -Y 500 -Text $zufälligeFrage50.Antworten[2]
$checkbox4 = New-CheckBox -X 530 -Y 600 -Text $zufälligeFrage50.Antworten[3]

# SetSingleCheckbox aufruf damit nur eine CHeckbox ausgewählt sein kann
$checkbox1.add_CheckedChanged({ SetSingleCheckbox $checkbox1 @($checkbox2, $checkbox3, $checkbox4) })
$checkbox2.add_CheckedChanged({ SetSingleCheckbox $checkbox2 @($checkbox1, $checkbox3, $checkbox4) })
$checkbox3.add_CheckedChanged({ SetSingleCheckbox $checkbox3 @($checkbox1, $checkbox2, $checkbox4) })
$checkbox4.add_CheckedChanged({ SetSingleCheckbox $checkbox4 @($checkbox1, $checkbox2, $checkbox3) })

# on click
$button.add_click({
    $Script:spielername = $textbox.Text
    Write-Host "Spielername: $spielername"
    $Form.Controls.Remove($textbox)
    $Form.Controls.Remove($button)
    $Form.Controls.Add($questionLabel)
    $Form.Controls.Add($submitButton)
    $Form.Controls.Add($checkbox1)
    $Form.Controls.Add($checkbox2)
    $Form.Controls.Add($checkbox3)
    $Form.Controls.Add($checkbox4)
    $Form.Size = New-Object System.Drawing.Size (1261, 762)
    $Form.BackgroundImage = $bild2
    $Form.Controls.Add($joker5050Button)
    $Form.Controls.Add($joker7525Button)
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

#Handler für den 50:50Joker-Button
$joker5050Button.add_Click({
    
    Activate5050Joker -currentQuestion $counter
    $mediaplayer.Open($5050)
    $mediaplayer.Play()
})

#Handler für den 50:50Joker-Button
$joker7525Button.add_Click({
    
    Activate7525Joker -currentQuestion $counter
    $mediaplayer.Open($5050)
    $mediaplayer.Play()
})

# Handler für den Beenden Button
$beendenButton.add_Click({
    Log-SpielErgebnis -Spielername $spielername -currentQuestion $counter
    $Form.Close()
})

# Handler für die Submit-Buttons und für die Next-Buttons
$submitButton.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage50.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage50.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage50.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage50.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage50.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton)
            $Form.Controls.Add($nextButton)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot und die richtige Antwort grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton.add_Click({
    $questionLabel.Text = $zufälligeFrage100.Frage
    $Form.Controls.Add($submitButton2)
    $Form.Controls.Remove($submitButton)
    $Form.Controls.Remove($nextButton)    
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black    
    $checkbox1.Checked = $false
    $checkbox2.Checked = $false
    $checkbox3.Checked = $false
    $checkbox4.Checked = $false  
    $checkbox1.Text = $zufälligeFrage100.Antworten[0]
    $checkbox2.Text = $zufälligeFrage100.Antworten[1]
    $checkbox3.Text = $zufälligeFrage100.Antworten[2]
    $checkbox4.Text = $zufälligeFrage100.Antworten[3]
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

$submitButton2.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage100.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage100.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage100.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage100.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage100.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton2)
            $Form.Controls.Add($nextButton2)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton2)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton2.add_Click({
    $questionLabel.Text = $zufälligeFrage200.Frage
    $Form.Controls.Add($submitButton3)
    $Form.Controls.Remove($submitButton2)
    $Form.Controls.Remove($nextButton2)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage200.Antworten[0]
    $checkbox2.Text = $zufälligeFrage200.Antworten[1]
    $checkbox3.Text = $zufälligeFrage200.Antworten[2]
    $checkbox4.Text = $zufälligeFrage200.Antworten[3]
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

$submitButton3.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage200.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage200.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage200.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage200.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage200.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton3)
            $Form.Controls.Add($nextButton3)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton3)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton3.add_Click({
    $questionLabel.Text = $zufälligeFrage300.Frage
    $Form.Controls.Add($submitButton4)
    $Form.Controls.Remove($submitButton3)
    $Form.Controls.Remove($nextButton3)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage300.Antworten[0]
    $checkbox2.Text = $zufälligeFrage300.Antworten[1]
    $checkbox3.Text = $zufälligeFrage300.Antworten[2]
    $checkbox4.Text = $zufälligeFrage300.Antworten[3]
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

$submitButton4.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage300.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage300.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage300.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage300.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage300.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton4)
            $Form.Controls.Add($nextButton4)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton4)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton4.add_Click({
    $questionLabel.Text = $zufälligeFrage500.Frage
    $Form.Controls.Add($submitButton5)
    $Form.Controls.Remove($submitButton4)
    $Form.Controls.Remove($nextButton4)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage500.Antworten[0]
    $checkbox2.Text = $zufälligeFrage500.Antworten[1]
    $checkbox3.Text = $zufälligeFrage500.Antworten[2]
    $checkbox4.Text = $zufälligeFrage500.Antworten[3]
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

$submitButton5.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage500.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage500.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage500.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage500.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage500.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton5)
            $Form.Controls.Add($nextButton5)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton5)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton5.add_Click({
    $questionLabel.Text = $zufälligeFrage1000.Frage
    $Form.Controls.Add($submitButton6)
    $Form.Controls.Remove($submitButton5)
    $Form.Controls.Remove($nextButton5)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage1000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage1000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage1000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage1000.Antworten[3]
    $mediaplayer.Open($100_1000question)
    $mediaplayer.Play()
})

$submitButton6.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    # Ermittle die Checkbox mit der richtigen Antwort
    if ($checkbox1.Text -eq $zufälligeFrage1000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage1000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage1000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage1000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage1000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton6)
            $Form.Controls.Add($nextButton6)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton6)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton6.add_Click({
    $questionLabel.Text = $zufälligeFrage2000.Frage
    $Form.Controls.Add($submitButton7)
    $Form.Controls.Remove($submitButton6)
    $Form.Controls.Remove($nextButton6)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage2000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage2000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage2000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage2000.Antworten[3]
    $mediaplayer.Open($2000question)
    $mediaplayer.Play()
})

$submitButton7.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage2000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage2000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage2000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage2000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage2000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton7)
            $Form.Controls.Add($nextButton7)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton7)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton7.add_Click({
    $questionLabel.Text = $zufälligeFrage4000.Frage
    $Form.Controls.Add($submitButton8)
    $Form.Controls.Remove($submitButton7)
    $Form.Controls.Remove($nextButton7)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage4000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage4000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage4000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage4000.Antworten[3]
    $mediaplayer.Open($4000question)
    $mediaplayer.Play()
})

$submitButton8.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage4000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage4000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage4000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage4000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage4000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton8)
            $Form.Controls.Add($nextButton8)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton8)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton8.add_Click({
    $questionLabel.Text = $zufälligeFrage8000.Frage
    $Form.Controls.Add($submitButton9)
    $Form.Controls.Remove($submitButton8)
    $Form.Controls.Remove($nextButton8)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage8000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage8000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage8000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage8000.Antworten[3]
    $mediaplayer.Open($8000question)
    $mediaplayer.Play()
})

$submitButton9.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage8000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage8000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage8000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage8000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage8000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton9)
            $Form.Controls.Add($nextButton9)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton9)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton9.add_Click({
    $questionLabel.Text = $zufälligeFrage16000.Frage
    $Form.Controls.Add($submitButton10)
    $Form.Controls.Remove($submitButton9)
    $Form.Controls.Remove($nextButton9)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage16000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage16000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage16000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage16000.Antworten[3]
    $mediaplayer.Open($16000question)
    $mediaplayer.Play()
})

$submitButton10.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage16000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage16000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage16000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage16000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage16000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton10)
            $Form.Controls.Add($nextButton10)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton10)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton10.add_Click({
    $questionLabel.Text = $zufälligeFrage32000.Frage
    $Form.Controls.Add($submitButton11)
    $Form.Controls.Remove($submitButton10)
    $Form.Controls.Remove($nextButton10)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage32000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage32000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage32000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage32000.Antworten[3]
    $mediaplayer.Open($32000question)
    $mediaplayer.Play()
})

$submitButton11.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage32000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage32000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage32000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage32000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage32000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton11)
            $Form.Controls.Add($nextButton11)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton11)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton11.add_Click({
    $questionLabel.Text = $zufälligeFrage64000.Frage
    $Form.Controls.Add($submitButton12)
    $Form.Controls.Remove($submitButton11)
    $Form.Controls.Remove($nextButton11)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage64000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage64000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage64000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage64000.Antworten[3]
    $mediaplayer.Open($64000question)
    $mediaplayer.Play()
})

$submitButton12.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage64000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage64000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage64000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage64000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage64000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton12)
            $Form.Controls.Add($nextButton12)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton12)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton12.add_Click({
    $questionLabel.Text = $zufälligeFrage125000.Frage
    $Form.Controls.Add($submitButton13)
    $Form.Controls.Remove($submitButton12)
    $Form.Controls.Remove($nextButton12)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage125000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage125000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage125000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage125000.Antworten[3]
    $mediaplayer.Open($125000question)
    $mediaplayer.Play()
})

$submitButton13.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage125000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage125000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage125000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage125000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage125000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton13)
            $Form.Controls.Add($nextButton13)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton13)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton13.add_Click({
    $questionLabel.Text = $zufälligeFrage500000.Frage
    $Form.Controls.Add($submitButton14)
    $Form.Controls.Remove($submitButton13)
    $Form.Controls.Remove($nextButton13)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage500000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage500000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage500000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage500000.Antworten[3]
    $mediaplayer.Open($500000question)
    $mediaplayer.Play()
})

$submitButton14.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage500000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage500000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage500000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage500000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage500000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton14)
            $Form.Controls.Add($nextButton14)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton14)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

$nextButton14.add_Click({
    $questionLabel.Text = $zufälligeFrage1000000.Frage
    $Form.Controls.Add($submitButton15)
    $Form.Controls.Remove($submitButton14)
    $Form.Controls.Remove($nextButton14)
    $checkbox1.ForeColor = [System.Drawing.Color]::Black
    $checkbox2.ForeColor = [System.Drawing.Color]::Black
    $checkbox3.ForeColor = [System.Drawing.Color]::Black
    $checkbox4.ForeColor = [System.Drawing.Color]::Black
    $checkbox1.checked = $false
    $checkbox2.checked = $false
    $checkbox3.checked = $false
    $checkbox4.checked = $false
    $checkbox1.Text = $zufälligeFrage1000000.Antworten[0]
    $checkbox2.Text = $zufälligeFrage1000000.Antworten[1]
    $checkbox3.Text = $zufälligeFrage1000000.Antworten[2]
    $checkbox4.Text = $zufälligeFrage1000000.Antworten[3]
    $mediaplayer.Open($1000000question)
    $mediaplayer.Play()
})

$submitButton15.add_Click({
    $selectedCheckbox = $null
    $correctCheckbox = $null

    # Ermittle, welche Checkbox ausgewählt wurde
    if ($checkbox1.Checked) {
        $selectedCheckbox = $checkbox1
    } elseif ($checkbox2.Checked) {
        $selectedCheckbox = $checkbox2
    } elseif ($checkbox3.Checked) {
        $selectedCheckbox = $checkbox3
    } elseif ($checkbox4.Checked) {
        $selectedCheckbox = $checkbox4
    }

    if ($checkbox1.Text -eq $zufälligeFrage1000000.RichtigeAntwort) {
        $correctCheckbox = $checkbox1
    } elseif ($checkbox2.Text -eq $zufälligeFrage1000000.RichtigeAntwort) {
        $correctCheckbox = $checkbox2
    } elseif ($checkbox3.Text -eq $zufälligeFrage1000000.RichtigeAntwort) {
        $correctCheckbox = $checkbox3
    } elseif ($checkbox4.Text -eq $zufälligeFrage1000000.RichtigeAntwort) {
        $correctCheckbox = $checkbox4
    }

    if ($selectedCheckbox) {
        # Überprüfe die ausgewählte Checkbox und prüfe, ob die Antwort korrekt ist
        $correctAnswer = $selectedCheckbox.Text

        if ($correctAnswer -eq $zufälligeFrage1000000.RichtigeAntwort) {
            # Antwort ist korrekt, färbe die ausgewählte Checkbox grün
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($1000000win)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton15)
            $Form.Controls.Add($beendenButton)
            $script:counter++
        } else {
            # Antwort ist falsch, färbe die ausgewählte Checkbox rot
            $selectedCheckbox.ForeColor = [System.Drawing.Color]::Red
            $correctCheckbox.ForeColor = [System.Drawing.Color]::Green
            $mediaplayer.Open($1000000lose)
            $mediaplayer.Play()
            $Form.Controls.Remove($submitButton15)
            $Form.Controls.Add($beendenButton)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie eine Antwort aus!", "Hinweis", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})

[void] $Form.ShowDialog()