#### Chargement Windows Forms ####
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#### Fonction secondaire ####
function makeshortcut{

            $form3 = New-Object System.Windows.Forms.Form
            $form3.Text = "Menu des raccourcis"
            $form3.Size = New-Object System.Drawing.Size(400, 400)
            $form3.StartPosition = "CenterScreen"

            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "a) Icône éteindre"
            $buttona.Location = New-Object System.Drawing.Point(10, 10)
            $buttona.Size = New-Object System.Drawing.Size(360, 30)
            $buttona.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Éteindre.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/p"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,027"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttona)    

            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "b) Icône redémarrage"
            $buttonb.Location = New-Object System.Drawing.Point(10, 50)
            $buttonb.Size = New-Object System.Drawing.Size(360, 30)
            $buttonb.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Redémarrage.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/r /t 0"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,238"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttonb) 
            
            $buttonc = New-Object System.Windows.Forms.Button
            $buttonc.Text = "c) Icône veille"
            $buttonc.Location = New-Object System.Drawing.Point(10, 90)
            $buttonc.Size = New-Object System.Drawing.Size(360, 30)
            $buttonc.Add_Click(
                {
                    $SourceFilePath = "rundll32.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Veille.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "powrprof.dll,SetSuspendState 0,1,0"
                    $shortcut.TargetPath = $SourceFilePath 
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,025"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttonc)
            
            $buttond = New-Object System.Windows.Forms.Button
            $buttond.Text = "d) Icône déconnexion"
            $buttond.Location = New-Object System.Drawing.Point(10, 130)
            $buttond.Size = New-Object System.Drawing.Size(360, 30)
            $buttond.Add_Click(
                {
                    $SourceFilePath = "C:\Windows\System32\shutdown.exe /l"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Déconnexion.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,044"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttond)

            $buttone = New-Object System.Windows.Forms.Button
            $buttone.Text = "Quitter"
            $buttone.Location = New-Object System.Drawing.Point(10, 210)
            $buttone.Size = New-Object System.Drawing.Size(360, 30)
            $buttone.Add_Click({
                $form3.Close()
            })
            $form3.Controls.Add($buttone)

            $form3.Add_Shown({ $form3.Activate() })
            [void]$form3.ShowDialog()
}
function scan{    

            $form2 = New-Object System.Windows.Forms.Form
            $form2.Text = "Menu des scans"
            $form2.Size = New-Object System.Drawing.Size(400, 450)
            $form2.StartPosition = "CenterScreen"
           
            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "a) sfc /scannow"
            $buttona.Location = New-Object System.Drawing.Point(10, 10)
            $buttona.Size = New-Object System.Drawing.Size(360, 30)
            $buttona.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c sfc /scannow && timeout /t 10"
                })
                $form2.Controls.Add($buttona)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,50)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Effectuer contrôle du magasin :"
            $form2.Controls.Add($label)
            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "b) DISM /Online /Cleanup-image /Scanhealth"
            $buttonb.Location = New-Object System.Drawing.Point(10, 70)
            $buttonb.Size = New-Object System.Drawing.Size(360, 30)
            $buttonb.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Scanhealth && timeout /t 10"
                })
                $form2.Controls.Add($buttonb)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,110)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Savoir si le magasin est réparable :"
            $form2.Controls.Add($label)
            $buttonc = New-Object System.Windows.Forms.Button
            $buttonc.Text = "c) DISM /Online /Cleanup-image /Checkhealth"
            $buttonc.Location = New-Object System.Drawing.Point(10, 130)
            $buttonc.Size = New-Object System.Drawing.Size(360, 30)
            $buttonc.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Checkhealth && timeout /t 10"
                })
                $form2.Controls.Add($buttonc)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,170)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Réparer le magasin :"
            $form2.Controls.Add($label)
            $buttond = New-Object System.Windows.Forms.Button
            $buttond.Text = "d) DISM /Online /Cleanup-image /Restorehealth"
            $buttond.Location = New-Object System.Drawing.Point(10, 190)
            $buttond.Size = New-Object System.Drawing.Size(360, 30)
            $buttond.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Restorehealth && timeout /t 10"
                })
                $form2.Controls.Add($buttond)

            $buttone = New-Object System.Windows.Forms.Button 
            $buttone.Font = New-Object System.Drawing.Font("Lucia console",10,[System.Drawing.FontStyle]::Bold)
            $buttone.Text = "e) Ligne de commande libre"
            $buttone.Location = New-Object System.Drawing.Point(10, 250)
            $buttone.Size = New-Object System.Drawing.Size(360, 30)
            $buttone.Add_Click({

#### Fenêtre de sélection du DISM ####

                    $form21 = New-Object System.Windows.Forms.Form
                    $form21.Text = "Sélectionner votre DISM"
                    $form21.Size = New-Object System.Drawing.Size(500, 250)
                    $form21.StartPosition = "CenterScreen"

                    $okButton = New-Object System.Windows.Forms.Button
                    $okButton.Location = New-Object System.Drawing.Point(100,150)
                    $okButton.Size = New-Object System.Drawing.Size(75,23)
                    $okButton.Text = 'OK'
                    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                    $form21.AcceptButton = $okButton
                    $form21.Controls.Add($okButton)

                    $cancelButton = New-Object System.Windows.Forms.Button
                    $cancelButton.Location = New-Object System.Drawing.Point(195,150)
                    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                    $cancelButton.Text = 'Cancel'
                    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                    $form21.CancelButton = $cancelButton
                    $form21.Controls.Add($cancelButton)

                    $DISMHelp = New-Object System.Windows.Forms.Button
                    $DISMHelp.Location = New-Object System.Drawing.Point(290,150)
                    $DISMHelp.Size = New-Object System.Drawing.Size(75,23)
                    $DISMHelp.Text = 'Aide DISM'
                    $DISMHelp.Add_Click({

                                        #### Fenêtre d'aide au DISM ####

                                        $form212 = New-Object System.Windows.Forms.Form
                                        $form212.Text = "Aide au DISM"
                                        $form212.Size = New-Object System.Drawing.Size(500, 250)
                                        $form212.StartPosition = "CenterScreen"

                                        $listdism = dism.exe /? | Out-String
                                        $form212 = New-Object System.Windows.Forms.Form
                                        $form212.Text = "Aide au DISM"
                                        $form212.Size = New-Object System.Drawing.Size(700, 490)
                                        $form212.StartPosition = "CenterScreen"
                                        $Textboxdism = New-Object System.Windows.Forms.Textbox
                                        $Textboxdism.Location = New-Object System.Drawing.Point(10,20)
                                        $Textboxdism.Size = New-Object System.Drawing.Size(650,350)
                                        $Textboxdism.Multiline = $true
                                        $Textboxdism.ScrollBars = "Vertical"
                                        $Textboxdism.ReadOnly = $true
                                        $Textboxdism.Font = New-Object System.Drawing.Font("Consolas",10)
                                        $Textboxdism.Text = $listdism
                                        $form212.Controls.Add($Textboxdism)

                                        $closeButton = New-Object System.Windows.Forms.Button
                                        $closeButton.Location = New-Object System.Drawing.Point(320,400)
                                        $closeButton.Size = New-Object System.Drawing.Size(75,23)
                                        $closeButton.Text = 'Fermer'
                                        $closeButton.Add_Click({
                                        $form212.Close()
                                        })
                                        $form212.Controls.Add($closeButton)
                                        $form212.ShowDialog()
                                        })
                    $form21.Controls.Add($DISMHelp)

                    $labelapp = New-Object System.Windows.Forms.Label
                    $labelapp.Location = New-Object System.Drawing.Point(10,20)
                    $labelapp.Size = New-Object System.Drawing.Size(250,20)
                    $labelapp.Text = 'Entrer votre ligne de commande :'
                    $form21.Controls.Add($labelapp)
                        
                            $textbox = New-Object System.Windows.Forms.textbox
                            $textbox.Location = New-Object System.Drawing.Point(10,60)
                            $textbox.Size = New-Object System.Drawing.Size(400,20)
                            $form21.Controls.Add($textbox)
                    
                    $form21.Add_Shown({$textbox.Select()})
                    $result = $form21.ShowDialog()

                    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
                    {
                        $actioncmd = $textBox.Text
                        Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c", $actioncmd
                    }
                })

            $form2.Controls.Add($buttone)

            $buttonf = New-Object System.Windows.Forms.Button
            $buttonf.Text = "Quitter"
            $buttonf.Location = New-Object System.Drawing.Point(10, 350)
            $buttonf.Size = New-Object System.Drawing.Size(360, 30)
            $buttonf.Add_Click({
                $form2.Close()
            })
            $form2.Controls.Add($buttonf)

            $form2.Add_Shown({ $form2.Activate() })
            [void]$form2.ShowDialog()
}
function killapp{

            $form4 = New-Object System.Windows.Forms.Form
            $form4.Text = "Liste des applications"
            $form4.Size = New-Object System.Drawing.Size(380,250)
            $form4.StartPosition = "CenterScreen"
            
            $okButton = New-Object System.Windows.Forms.Button
            $okButton.Location = New-Object System.Drawing.Point(100,160)
            $okButton.Size = New-Object System.Drawing.Size(75,23)
            $okButton.Text = 'OK'
            $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
            $form4.AcceptButton = $okButton
            $form4.Controls.Add($okButton)

            $cancelButton = New-Object System.Windows.Forms.Button
            $cancelButton.Location = New-Object System.Drawing.Point(195,160)
            $cancelButton.Size = New-Object System.Drawing.Size(75,23)
            $cancelButton.Text = 'Cancel'
            $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
            $form4.CancelButton = $cancelButton
            $form4.Controls.Add($cancelButton)

#### Relance app en route ####

            $labelapp = New-Object System.Windows.Forms.Label
            $labelapp.Location = New-Object System.Drawing.Point(10,20)
            $labelapp.Size = New-Object System.Drawing.Size(280,20)
            $labelapp.Text = 'Sélectionner une application (Active)'
            $form4.Controls.Add($labelapp)

            $ComboBox = New-Object System.Windows.Forms.ComboBox
            $ComboBox.Location = New-Object System.Drawing.Point(10,50)
            $ComboBox.Size = New-Object System.Drawing.Size(340,400)
            $ComboBox.Height = 100
            $listapp = Get-Process | Where-Object {$_.MainWindowTitle} | Select-Object Name, Description | Group-Object Name | Foreach-Object {$_.Group | Select-Object -First 1}
            $ComboBox.DataSource = $listapp | Foreach-Object {"$($_.Name)-$($_.Description)"}

#### Relance app planté ####

            $labelapp2 = New-Object System.Windows.Forms.Label
            $labelapp2.Location = New-Object System.Drawing.Point(10,90)
            $labelapp2.Size = New-Object System.Drawing.Size(280,20)
            $labelapp2.Text = 'Sélectionner une application (Planté)'
            $form4.Controls.Add($labelapp2)

            $ComboBox2 = New-Object System.Windows.Forms.ComboBox
            $ComboBox2.Location = New-Object System.Drawing.Point(10,120)
            $ComboBox2.Size = New-Object System.Drawing.Size(340,400)
            $ComboBox2.Height = 100
            $noresponding = Get-Process | Where-Object {$_.Responding -eq $false} | Select-Object Name, Description | Group-Object Name | Foreach-Object {$_.Group | Select-Object -First 1}
            $ComboBox2.DataSource = $noresponding | Foreach-Object {"$($_.Name)-$($_.Description)"} -ErrorAction SilentlyContinue
            
            $form4.Controls.Add($ComboBox)
            $form4.Controls.Add($ComboBox2)
            $form4.Topmost = $true
            $result = $form4.ShowDialog()

            if ($result -eq [System.Windows.Forms.DialogResult]::OK)
            {
                $app = $ComboBox.Text
                Stop-Process -Name $app.Split("-")[0]
                Start-Process $app.Split("-")[0]
            }

            if ($result -eq [System.Windows.Forms.DialogResult]::OK)
            {
                $app2 = $ComboBox2.Text
                Stop-Process -Name $app2.Split("-")[0]
                Start-Process $app2.Split("-")[0]
            }

}
function event{

        $form71 = New-Object System.Windows.Forms.Form
        $form71.Text = "Filtrage des éléments"
        $form71.Size = New-Object System.Drawing.Size(350, 250)
        $form71.StartPosition = "CenterScreen"

        $okButton = New-Object System.Windows.Forms.Button
        $okButton.Location = New-Object System.Drawing.Point(100,170)
        $okButton.Size = New-Object System.Drawing.Size(75,23)
        $okButton.Text = 'Chercher'
        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $form71.AcceptButton = $okButton
        $form71.Controls.Add($okButton)

        $quitButton = New-Object System.Windows.Forms.Button
        $quitButton.Text = "Quitter"
        $quitButton.Location = New-Object System.Drawing.Point(192, 170)
        $quitButton.Size = New-Object System.Drawing.Size(75, 23)
        $quitButton.Add_Click({
            $form71.Close()
        })
        $form71.Controls.Add($quitButton)


                    $labeltype = New-Object System.Windows.Forms.Label
                    $labeltype.Location = New-Object System.Drawing.Point(20,20)
                    $labeltype.Size = New-Object System.Drawing.Size(150,30)
                    $labeltype.Text = "Quel type d'évènement ?"
                    $form71.Controls.Add($labeltype)

                            $typebox = New-Object System.Windows.Forms.combobox
                            $typebox.Location = New-Object System.Drawing.Point(30,50)
                            $typebox.Size = New-Object System.Drawing.Size(100,50)
                            $typebox.DataSource = 'Application', 'Security', 'Installation', 'System'
                            $form71.Controls.Add($typebox)

                    $labellvl = New-Object System.Windows.Forms.Label
                    $labellvl.Location = New-Object System.Drawing.Point(200,20)
                    $labellvl.Size = New-Object System.Drawing.Size(150,30)
                    $labellvl.Text = "Quel niveau d'erreur ?"
                    $form71.Controls.Add($labellvl)
                        
                            $lvlbox = New-Object System.Windows.Forms.combobox
                            $lvlbox.Location = New-Object System.Drawing.Point(200,50)
                            $lvlbox.Size = New-Object System.Drawing.Size(100,50)
                            $lvlbox.DataSource = 'Erreur', 'Critique', 'Avertissement', 'Information'
                            $form71.Controls.Add($lvlbox)

                    $labeldatestart = New-Object System.Windows.Forms.Label
                    $labeldatestart.Location = New-Object System.Drawing.Point(20,90)
                    $labeldatestart.Size = New-Object System.Drawing.Size(140,40)
                    $labeldatestart.Text = "Date de début (par défaut aujourd'hui) ? (DD/MM/YYYY)"
                    $form71.Controls.Add($labeldatestart)
                        
                            $eventboxstart = New-Object System.Windows.Forms.textbox
                            $eventboxstart.Location = New-Object System.Drawing.Point(30,130)
                            $eventboxstart.Size = New-Object System.Drawing.Size(100,50)
                            $form71.Controls.Add($eventboxstart)

                    $labeldateend = New-Object System.Windows.Forms.Label
                    $labeldateend.Location = New-Object System.Drawing.Point(200,90)
                    $labeldateend.Size = New-Object System.Drawing.Size(140,40)
                    $labeldateend.Text = "Date de fin ? (DD/MM/YYYY)"
                    $form71.Controls.Add($labeldateend)
                        
                            $eventboxend = New-Object System.Windows.Forms.textbox
                            $eventboxend.Location = New-Object System.Drawing.Point(200,130)
                            $eventboxend.Size = New-Object System.Drawing.Size(100,50)
                            $form71.Controls.Add($eventboxend)
                    
                    $form71.Add_Shown({$typebox.Select()})
                    $resultevent = $form71.ShowDialog()
        if ($resultevent -eq [System.Windows.Forms.DialogResult]::OK)
                {
                    $typeevent = $typebox.Text
                    $lvl = $lvlbox.Text

                if  ($null -eq $eventboxstart.text)
                    {
                    $datestart = Get-Date -Format "MM/dd/yyyy"
                    }
                else{
                    $datestart = $eventboxstart.Text
                    }
        
                    $datestart = $eventboxstart.Text
                    $dateend = $eventboxend.Text
                    $eventout = Get-WinEvent -LogName $typeevent | Where-Object {($_.LevelDisplayName -eq $lvl) -and ($_.TimeCreated -lt $datestart) -and ($_.TimeCreated -gt $dateend)}
              
                    $form711 = New-Object System.Windows.Forms.Form
                    $form711.Text = "Résultat recherche"
                    $form711.Size = New-Object System.Drawing.Size(720, 490)
                    $form711.StartPosition = "CenterScreen"
                    $Textboxeventout = New-Object System.Windows.Forms.Textbox
                    $Textboxeventout.Location = New-Object System.Drawing.Point(10,20)
                    $Textboxeventout.Size = New-Object System.Drawing.Size(650,350)
                    $Textboxeventout.Multiline = $true
                    $Textboxeventout.ScrollBars = "Vertical"
                    $Textboxeventout.ReadOnly = $true
                    $Textboxeventout.Font = New-Object System.Drawing.Font("Consolas",10)
                    $Textboxeventout.Text = $eventout
                    $form711.Controls.Add($Textboxeventout)
                    $form711.ShowDialog()

                    $quitButton = New-Object System.Windows.Forms.Button
                    $quitButton.Text = "Quitter"
                    $quitButton.Location = New-Object System.Drawing.Point(690, 170)
                    $quitButton.Size = New-Object System.Drawing.Size(75, 23)
                    $quitButton.Add_Click({
                        $form711.Close()
                    })
                }
}
function app{

    $form8 = New-Object System.Windows.Forms.Form
    $form8.Text = "Menu des Applications"
    $form8.Size = New-Object System.Drawing.Size(400, 400)
    $form8.StartPosition = "CenterScreen"

    $button81 = New-Object System.Windows.Forms.Button
    $button81.Text = "Intel support assistant"
    $button81.Location = New-Object System.Drawing.Point(10, 10)
    $button81.Size = New-Object System.Drawing.Size(360, 30)
    $button81.Add_Click({
        Start-Process https://dsadata.intel.com/installer
    })
    $form8.Controls.Add($button81)

    $button82 = New-Object System.Windows.Forms.Button
    $button82.Text = "Malwarebytes"
    $button82.Location = New-Object System.Drawing.Point(10, 50)
    $button82.Size = New-Object System.Drawing.Size(360, 30)
    $button82.Add_Click({
        Start-Process "https://www.malwarebytes.com/fr/mwb-download/thankyou"
    })
    $form8.Controls.Add($button82)

    $button83 = New-Object System.Windows.Forms.Button
    $button83.Text = "ADWCleaner"
    $button83.Location = New-Object System.Drawing.Point(10, 90)
    $button83.Size = New-Object System.Drawing.Size(360, 30)
    $button83.Add_Click({
        Start-Process https://adwcleaner.malwarebytes.com/adwcleaner?channel=release
    })
    $form8.Controls.Add($button83)

    $button84 = New-Object System.Windows.Forms.Button
    $button84.Text = "Dell Power Manager"
    $button84.Location = New-Object System.Drawing.Point(10, 130)
    $button84.Size = New-Object System.Drawing.Size(360, 30)
    $button84.Add_Click({
        Start-Process https://dl.dell.com/FOLDER07383273M/5/Dell-Power-Manager-Service_GD7J6_WIN64_3.9.0_A00_03.EXE
    })
    $form8.Controls.Add($button84)

    $button85 = New-Object System.Windows.Forms.Button
    $button85.Text = "Dell support assist"
    $button85.Location = New-Object System.Drawing.Point(10, 170)
    $button85.Size = New-Object System.Drawing.Size(360, 30)
    $button85.Add_Click({
        Start-Process https://downloads.dell.com/serviceability/catalog/SupportAssistinstaller.exe
    })
    $form8.Controls.Add($button85)

    $quitButton = New-Object System.Windows.Forms.Button
    $quitButton.Text = "Quitter"
    $quitButton.Location = New-Object System.Drawing.Point(145, 300)
    $quitButton.Size = New-Object System.Drawing.Size(100, 23)
    $quitButton.Add_Click({
        $form8.Close()
    })
    $form8.Controls.Add($quitButton)

    $form8.Add_Shown({ $form8.Activate() })
    [void]$form8.ShowDialog()
}

#### Interface principale ####

function Show-MenuForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Menu des Actions"
    $form.Size = New-Object System.Drawing.Size(400, 450)
    $form.StartPosition = "CenterScreen"

#### Ouverture dossier fichiers temp ####

    $button1 = New-Object System.Windows.Forms.Button
    $button1.Text = "1) Ouvrir dossiers fichiers temporaire"
    $button1.Location = New-Object System.Drawing.Point(10, 10)
    $button1.Size = New-Object System.Drawing.Size(360, 30)
    $button1.Add_Click({
    
    $pathstemp = @("C:\Windows\Temp", "C:\Temp", $env:temp)
    $pathstemp | foreach-object {if (Test-path $_) {Invoke-item $_}}
    })

    $form.Controls.Add($button1)

#### Création des raccourcis ####

    $button2 = New-Object System.Windows.Forms.Button
    $button2.Text = "2) Création raccourcis"
    $button2.Location = New-Object System.Drawing.Point(10, 50)
    $button2.Size = New-Object System.Drawing.Size(360, 30)
    $button2.Add_Click({
        makeshortcut
    })
    $form.Controls.Add($button2)

#### Menu des scan système ####

    $button3 = New-Object System.Windows.Forms.Button
    $button3.Text = "3) Scan système"
    $button3.Location = New-Object System.Drawing.Point(10, 90)
    $button3.Size = New-Object System.Drawing.Size(360, 30)
    $button3.Add_Click({
        scan
    })
    $form.Controls.Add($button3)

#### Rapport Batt ####

    $button4 = New-Object System.Windows.Forms.Button
    $button4.Text = "4) Rapport batterie"
    $button4.Location = New-Object System.Drawing.Point(10, 130)
    $button4.Size = New-Object System.Drawing.Size(360, 30)
    $button4.Add_Click({
        Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c powercfg /batteryreport && "%userprofile%\battery-report.html"'
    })
    $form.Controls.Add($button4)

#### Relance du services d'imp ####

    $button5 = New-Object System.Windows.Forms.Button
    $button5.Text = "5) Redémarrer le service d'impression"
    $button5.Location = New-Object System.Drawing.Point(10, 170)
    $button5.Size = New-Object System.Drawing.Size(360, 30)
    $button5.Add_Click({
        Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c net stop spooler && net start spooler && timeout /t 5"
    })
    $form.Controls.Add($button5)

#### Relance des app ####

    $button6 = New-Object System.Windows.Forms.Button
    $button6.Text = "6) Relancer une application"
    $button6.Location = New-Object System.Drawing.Point(10, 210)
    $button6.Size = New-Object System.Drawing.Size(360, 30)
    $button6.Add_Click({
        killapp
    })
    $form.Controls.Add($button6)

#### Obs event ####

    $button7 = New-Object System.Windows.Forms.Button
    $button7.Text = "7) Resortir des évènements"
    $button7.Location = New-Object System.Drawing.Point(10, 250)
    $button7.Size = New-Object System.Drawing.Size(360, 30)
    $button7.Add_Click({
    event
    })
    $form.Controls.Add($button7)

#### DL App ####

    $button7 = New-Object System.Windows.Forms.Button
    $button7.Text = "8) Télécharger application"
    $button7.Location = New-Object System.Drawing.Point(10, 290)
    $button7.Size = New-Object System.Drawing.Size(360, 30)
    $button7.Add_Click({
    app
    })
    $form.Controls.Add($button7)

#### Sortie ####

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(10, 350)
    $buttonquit.Size = New-Object System.Drawing.Size(360, 30)
    $buttonquit.Add_Click({
        $form.Close()
    })
    $form.Controls.Add($buttonquit)

    # Afficher le formulaire
    $form.Add_Shown({ $form.Activate() })
    [void]$form.ShowDialog()
}

#################################################################
#######################DEBUT DU SCRIPT###########################
#################################################################
Show-MenuForm