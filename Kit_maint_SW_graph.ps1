#### Chargement Windows Forms ####
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$quitbackcolor = 'LightSalmon'
$boldbutton = New-Object System.Drawing.Font("Arial", 10,[System.Drawing.FontStyle]::Bold)


#### Fonction secondaire ####
function makeshortcut{

            $form3 = New-Object System.Windows.Forms.Form
            $form3.Text = "Menu des raccourcis"
            $form3.Size = New-Object System.Drawing.Size(300, 300)
            $form3.StartPosition = "CenterScreen"

            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "a) Icone eteindre"
            $buttona.Location = New-Object System.Drawing.Point(10, 10)
            $buttona.Size = New-Object System.Drawing.Size(250, 30)
            $buttona.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\eteindre.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/p"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,027"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttona)    

            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "b) Icone redemarrage"
            $buttonb.Location = New-Object System.Drawing.Point(10, 50)
            $buttonb.Size = New-Object System.Drawing.Size(250, 30)
            $buttonb.Add_Click(
                {
                    $SourceFilePath = "shutdown.exe"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Redemarrage.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $Shortcut.Arguments = "/r /t 0"
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,238"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttonb) 
            
            $buttonc = New-Object System.Windows.Forms.Button
            $buttonc.Text = "c) Icone veille"
            $buttonc.Location = New-Object System.Drawing.Point(10, 90)
            $buttonc.Size = New-Object System.Drawing.Size(250, 30)
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
            $buttond.Text = "d) Icone deconnexion"
            $buttond.Location = New-Object System.Drawing.Point(10, 130)
            $buttond.Size = New-Object System.Drawing.Size(250, 30)
            $buttond.Add_Click(
                {
                    $SourceFilePath = "C:\Windows\System32\shutdown.exe /l"
                    $ShortcutPath = [System.Environment]::GetFolderPath('Desktop')+"\Deconnexion.lnk"
                    $WScriptObj = New-Object -ComObject ("WScript.Shell")
                    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
                    $shortcut.TargetPath = $SourceFilePath
                    $Shortcut.IconLocation = "%SystemRoot%\System32\shell32.dll,044"
                    $shortcut.Save()
                })
            $form3.Controls.Add($buttond)

            $buttonquit = New-Object System.Windows.Forms.Button
            $buttonquit.Text = "Quitter"
            $buttonquit.Location = New-Object System.Drawing.Point(65, 200)
            $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
            $buttonquit.Font = $boldbutton
            $buttonquit.BackColor = $quitbackcolor
            $buttonquit.Add_Click({
                $form3.Close()
            })
            $form3.Controls.Add($buttonquit)

            $form3.Add_Shown({ $form3.Activate() })
            [void]$form3.ShowDialog()
}
function info{
    
    $form41 = New-Object System.Windows.Forms.Form
    $form41.Text = "Information poste"
    $form41.Size = New-Object System.Drawing.Size(300, 370)
    $form41.StartPosition = "CenterScreen"

    $button41 = New-Object System.Windows.Forms.Button
    $button41.Text = "Rapport batterie"
    $button41.Location = New-Object System.Drawing.Point(10, 20)
    $button41.Size = New-Object System.Drawing.Size(260, 30)
    $button41.Add_Click({
    Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c powercfg /batteryreport && "%userprofile%\battery-report.html"'
    })
    $form41.Controls.Add($button41)

    $button42 = New-Object System.Windows.Forms.Button
    $button42.Text = "Numéro de série"
    $button42.Location = New-Object System.Drawing.Point(10, 60)
    $button42.Size = New-Object System.Drawing.Size(260, 30)
    $button42.Add_Click({
    Start-Process cmd -Verb runAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList '/c wmic bios get serialnumber && pause'
    })
    $form41.Controls.Add($button42)

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(10, 250)
    $buttonquit.Size = New-Object System.Drawing.Size(260, 30)
    $buttonquit.Font = $boldbutton
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.Add_Click({
        $form41.Close()
    })
    $form41.Controls.Add($buttonquit)


    $form41.ShowDialog()

}
function scan{    

            $form2 = New-Object System.Windows.Forms.Form
            $form2.Text = "Menu des scans"
            $form2.Size = New-Object System.Drawing.Size(400, 450)
            $form2.StartPosition = "CenterScreen"
           
            $buttona = New-Object System.Windows.Forms.Button
            $buttona.Text = "sfc /scannow"
            $buttona.Location = New-Object System.Drawing.Point(10, 10)
            $buttona.Size = New-Object System.Drawing.Size(360, 30)
            $buttona.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c sfc /scannow && timeout /t 10"
                })
                $form2.Controls.Add($buttona)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,50)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Effectuer controle du magasin :"
            $form2.Controls.Add($label)
            $buttonb = New-Object System.Windows.Forms.Button
            $buttonb.Text = "DISM /Online /Cleanup-image /Scanhealth"
            $buttonb.Location = New-Object System.Drawing.Point(10, 70)
            $buttonb.Size = New-Object System.Drawing.Size(360, 30)
            $buttonb.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Scanhealth && timeout /t 10"
                })
                $form2.Controls.Add($buttonb)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,110)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Savoir si le magasin est reparable :"
            $form2.Controls.Add($label)
            $buttonc = New-Object System.Windows.Forms.Button
            $buttonc.Text = "DISM /Online /Cleanup-image /Checkhealth"
            $buttonc.Location = New-Object System.Drawing.Point(10, 130)
            $buttonc.Size = New-Object System.Drawing.Size(360, 30)
            $buttonc.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Checkhealth && timeout /t 10"
                })
                $form2.Controls.Add($buttonc)

            $label = New-Object System.Windows.Forms.Label
            $label.Location = New-Object System.Drawing.Point(10,170)
            $label.Size = New-Object System.Drawing.Size(280,20)
            $label.Text = "Reparer le magasin :"
            $form2.Controls.Add($label)
            $buttond = New-Object System.Windows.Forms.Button
            $buttond.Text = "DISM /Online /Cleanup-image /Restorehealth"
            $buttond.Location = New-Object System.Drawing.Point(10, 190)
            $buttond.Size = New-Object System.Drawing.Size(360, 30)
            $buttond.Add_Click({
                Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c DISM /Online /Cleanup-image /Restorehealth && timeout /t 10"
                })
                $form2.Controls.Add($buttond)

            $buttone = New-Object System.Windows.Forms.Button 
            $buttone.Font = New-Object System.Drawing.Font("Lucia console",10,[System.Drawing.FontStyle]::Bold)
            $buttone.BackColor = 'Green'
            $buttone.Text = "Ligne de commande libre"
            $buttone.Location = New-Object System.Drawing.Point(10, 250)
            $buttone.Size = New-Object System.Drawing.Size(360, 30)
            $buttone.Add_Click({

#### Fenetre de selection du DISM ####

                    $form21 = New-Object System.Windows.Forms.Form
                    $form21.Text = "Selectionner votre DISM"
                    $form21.Size = New-Object System.Drawing.Size(500, 180)
                    $form21.StartPosition = "CenterScreen"

                    $okButton = New-Object System.Windows.Forms.Button
                    $okButton.Location = New-Object System.Drawing.Point(110,100)
                    $okButton.Size = New-Object System.Drawing.Size(75,23)
                    $okButton.Text = 'OK'
                    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                    $form21.AcceptButton = $okButton
                    $form21.Controls.Add($okButton)

                    $cancelButton = New-Object System.Windows.Forms.Button
                    $cancelButton.Location = New-Object System.Drawing.Point(205,100)
                    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                    $cancelButton.Text = 'Cancel'
                    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                    $cancelButton.Font = $boldbutton
                    $cancelButton.BackColor = $quitbackcolor
                    $form21.CancelButton = $cancelButton
                    $form21.Controls.Add($cancelButton)

                    $DISMHelp = New-Object System.Windows.Forms.Button
                    $DISMHelp.Location = New-Object System.Drawing.Point(300,100)
                    $DISMHelp.Size = New-Object System.Drawing.Size(75,23)
                    $DISMHelp.Text = 'Aide DISM'
                    $DISMHelp.Add_Click({

                                        #### Fenetre d'aide au DISM ####

                                        $form212 = New-Object System.Windows.Forms.Form
                                        $form212.Text = "Aide au DISM"
                                        $form212.Size = New-Object System.Drawing.Size(500, 250)
                                        $form212.StartPosition = "CenterScreen"

                                        $listdism = dism.exe /? | Out-String
                                        $form212 = New-Object System.Windows.Forms.Form
                                        $form212.Text = "Aide au DISM"
                                        $form212.Size = New-Object System.Drawing.Size(700, 700)
                                        $form212.StartPosition = "CenterScreen"
                                        $Textboxdism = New-Object System.Windows.Forms.Textbox
                                        $Textboxdism.Location = New-Object System.Drawing.Point(10,20)
                                        $Textboxdism.Size = New-Object System.Drawing.Size(650, 550)
                                        $Textboxdism.Multiline = $true
                                        $Textboxdism.WordWrap = $false
                                        $Textboxdism.ScrollBars = [System.Windows.Forms.ScrollBars]::Both
                                        $Textboxdism.ReadOnly = $true
                                        $Textboxdism.Font = New-Object System.Drawing.Font("Consolas",10)
                                        $Textboxdism.Text = $listdism
                                        $form212.Controls.Add($Textboxdism)

                                        $buttonquit = New-Object System.Windows.Forms.Button
                                        $buttonquit.Location = New-Object System.Drawing.Point(300,600)
                                        $buttonquit.Size = New-Object System.Drawing.Size(75,23)
                                        $buttonquit.Font = New-Object System.Drawing.Font("Arial", 10,[System.Drawing.FontStyle]::Bold)
                                        $buttonquit.Text = 'Fermer'
                                        $buttonquit.Add_Click({
                                        $form212.Close()
                                        })
                                        $form212.Controls.Add($buttonquit)
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
                            $textbox.Size = New-Object System.Drawing.Size(460,20)
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

            $buttonquit = New-Object System.Windows.Forms.Button
            $buttonquit.Text = "Quitter"
            $buttonquit.Location = New-Object System.Drawing.Point(70, 350)
            $buttonquit.Size = New-Object System.Drawing.Size(250, 30)
            $buttonquit.Font = $boldbutton
            $buttonquit.BackColor = $quitbackcolor
            $buttonquit.Add_Click({
                $form2.Close()
            })
            $form2.Controls.Add($buttonquit)

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
            $cancelButton.Font = $boldbutton
            $cancelButton.BackColor = $quitbackcolor
            $form4.CancelButton = $cancelButton
            $form4.Controls.Add($cancelButton)

#### Relance app en route ####

            $labelapp = New-Object System.Windows.Forms.Label
            $labelapp.Location = New-Object System.Drawing.Point(10,20)
            $labelapp.Size = New-Object System.Drawing.Size(280,20)
            $labelapp.Text = 'Selectionner une application (Active)'
            $form4.Controls.Add($labelapp)

            $ComboBox = New-Object System.Windows.Forms.ComboBox
            $ComboBox.Location = New-Object System.Drawing.Point(10,50)
            $ComboBox.Size = New-Object System.Drawing.Size(340,400)
            $ComboBox.Height = 100
            $listapp = Get-Process | Where-Object {$_.MainWindowTitle} | Select-Object Name, Description | Group-Object Name | Foreach-Object {$_.Group | Select-Object -First 1}
            $ComboBox.DataSource = $listapp | Foreach-Object {"$($_.Name)-$($_.Description)"}

#### Relance app plante ####

            $labelapp2 = New-Object System.Windows.Forms.Label
            $labelapp2.Location = New-Object System.Drawing.Point(10,90)
            $labelapp2.Size = New-Object System.Drawing.Size(280,20)
            $labelapp2.Text = 'Selectionner une application (Plante)'
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
function wintools{

    $form71 = New-Object System.Windows.Forms.Form
    $form71.Text = "Outils Windows"
    $form71.Size = New-Object System.Drawing.Size(350, 400)
    $form71.StartPosition = "CenterScreen"

#### Ouverture dossier fichiers temp ####

    $button71 = New-Object System.Windows.Forms.Button
    $button71.Text = "Ouvrir dossiers fichiers temporaire"
    $button71.Location = New-Object System.Drawing.Point(40, 10)
    $button71.Size = New-Object System.Drawing.Size(250, 30)
    $button71.Add_Click({
    
    $pathstemp = @("C:\Windows\Temp", "C:\Temp", $env:temp)
    $pathstemp | foreach-object {if (Test-path $_) {Invoke-item $_}}
    })

    $form71.Controls.Add($button71)

#### Filtrer des events ####

    $button72 = New-Object System.Windows.Forms.Button
    $button72.Text = "Observateur d'evenements"
    $button72.Location = New-Object System.Drawing.Point(40, 50)
    $button72.Size = New-Object System.Drawing.Size(250, 30)
    $button72.Add_Click({

        $form72 = New-Object System.Windows.Forms.Form
        $form72.Text = "Filtrage des elements"
        $form72.Size = New-Object System.Drawing.Size(350, 250)
        $form72.StartPosition = "CenterScreen"

        $okButton = New-Object System.Windows.Forms.Button
        $okButton.Location = New-Object System.Drawing.Point(100,170)
        $okButton.Size = New-Object System.Drawing.Size(75,23)
        $okButton.Text = 'Chercher'
        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $form72.AcceptButton = $okButton
        $form72.Controls.Add($okButton)

        $buttonquit = New-Object System.Windows.Forms.Button
        $buttonquit.Text = "Quitter"
        $buttonquit.Location = New-Object System.Drawing.Point(192, 170)
        $buttonquit.Size = New-Object System.Drawing.Size(75, 23)
        $buttonquit.Font = $boldbutton
        $buttonquit.BackColor = $quitbackcolor
        $buttonquit.Add_Click({
            $form72.Close()
        })
        $form72.Controls.Add($buttonquit)

                    $labeltype = New-Object System.Windows.Forms.Label
                    $labeltype.Location = New-Object System.Drawing.Point(20,20)
                    $labeltype.Size = New-Object System.Drawing.Size(150,30)
                    $labeltype.Text = "Quel type d'evenement ?"
                    $form72.Controls.Add($labeltype)

                            $typebox = New-Object System.Windows.Forms.combobox
                            $typebox.Location = New-Object System.Drawing.Point(30,50)
                            $typebox.Size = New-Object System.Drawing.Size(100,50)
                            $typebox.DataSource = 'Application', 'Security', 'Installation', 'System'
                            $form72.Controls.Add($typebox)

                    $labellvl = New-Object System.Windows.Forms.Label
                    $labellvl.Location = New-Object System.Drawing.Point(200,20)
                    $labellvl.Size = New-Object System.Drawing.Size(150,30)
                    $labellvl.Text = "Quel niveau d'erreur ?"
                    $form72.Controls.Add($labellvl)
                        
                            $lvlbox = New-Object System.Windows.Forms.combobox
                            $lvlbox.Location = New-Object System.Drawing.Point(200,50)
                            $lvlbox.Size = New-Object System.Drawing.Size(100,50)
                            $lvlbox.DataSource = 'Erreur', 'Critique', 'Avertissement', 'Information'
                            $form72.Controls.Add($lvlbox)

                    $labeldatestart = New-Object System.Windows.Forms.Label
                    $labeldatestart.Location = New-Object System.Drawing.Point(20,90)
                    $labeldatestart.Size = New-Object System.Drawing.Size(140,40)
                    $labeldatestart.Text = "Date de debut (par defaut aujourd'hui) ? (DD/MM/YYYY)"
                    $form72.Controls.Add($labeldatestart)
                        
                            $eventboxstart = New-Object System.Windows.Forms.textbox
                            $eventboxstart.Location = New-Object System.Drawing.Point(30,130)
                            $eventboxstart.Size = New-Object System.Drawing.Size(100,50)
                            $form72.Controls.Add($eventboxstart)

                    $labeldateend = New-Object System.Windows.Forms.Label
                    $labeldateend.Location = New-Object System.Drawing.Point(200,90)
                    $labeldateend.Size = New-Object System.Drawing.Size(140,40)
                    $labeldateend.Text = "Date de fin ? (DD/MM/YYYY)"
                    $form72.Controls.Add($labeldateend)
                        
                            $eventboxend = New-Object System.Windows.Forms.textbox
                            $eventboxend.Location = New-Object System.Drawing.Point(200,130)
                            $eventboxend.Size = New-Object System.Drawing.Size(100,50)
                            $form72.Controls.Add($eventboxend)
                    
                    $form72.Add_Shown({$typebox.Select()})
                    $resultevent = $form72.ShowDialog()
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
                    $eventout = Get-WinEvent -LogName $typeevent | Where-Object {($_.LevelDisplayName -eq $lvl) -and ($_.TimeCreated -lt $datestart) -and ($_.TimeCreated -gt $dateend)} | Out-String
           
                    $form73 = New-Object System.Windows.Forms.Form
                    $form73.Text = "Resultat recherche"
                    $form73.Size = New-Object System.Drawing.Size(1000, 1000)
                    $form73.StartPosition = "CenterScreen"
                    $Textboxeventout = New-Object System.Windows.Forms.Textbox
                    $Textboxeventout.Location = New-Object System.Drawing.Point(10,20)
                    $Textboxeventout.Size = New-Object System.Drawing.Size(900, 900)
                    $Textboxeventout.Multiline = $true
                    $Textboxeventout.ScrollBars = [System.Windows.Forms.ScrollBars]::Both
                    $Textboxeventout.ReadOnly = $true
                    $Textboxeventout.Font = New-Object System.Drawing.Font("Consolas",10)
                    $Textboxeventout.Text = $eventout
                    $form73.Controls.Add($Textboxeventout)
                    $form73.ShowDialog()

                    $buttonquit = New-Object System.Windows.Forms.Button
                    $buttonquit.Text = "Quitter"
                    $buttonquit.Location = New-Object System.Drawing.Point(80, 170)
                    $buttonquit.Size = New-Object System.Drawing.Size(250, 30)
                    $buttonquit.Font = $boldbutton
                    $buttonquit.BackColor = $quitbackcolor
                    $buttonquit.Add_Click({
                        $form73.Close()
                    })
                }
    })
    $form71.Controls.Add($button72)

    $button73 = New-Object System.Windows.Forms.Button
    $button73.Text = "Rapport de fiabilite"
    $button73.Location = New-Object System.Drawing.Point(40, 90)
    $button73.Size = New-Object System.Drawing.Size(250, 30)
    $button73.Add_Click({
    perfmon /rel
    })
    $form71.Controls.Add($button73)

#### Relance du services d'imp ####

    $button74 = New-Object System.Windows.Forms.Button
    $button74.Text = "Redemarrer le service d'impression"
    $button74.Location = New-Object System.Drawing.Point(40, 130)
    $button74.Size = New-Object System.Drawing.Size(250, 30)
    $button74.Add_Click({
        Start-Process cmd -Verb RunAs -WorkingDirectory "$env:USERPROFILE" -ArgumentList "/c net stop spooler && net start spooler && timeout /t 5"
    })
    $form71.Controls.Add($button74)

#### Ouvrir services ####

    $button75 = New-Object System.Windows.Forms.Button
    $button75.Text = "Ouvrir les services"
    $button75.Location = New-Object System.Drawing.Point(40, 170)
    $button75.Size = New-Object System.Drawing.Size(250, 30)
    $button75.Add_Click({
    services.msc
    })
    $form71.Controls.Add($button75)

#### Ouvrir serveur imp ####

    $button76 = New-Object System.Windows.Forms.Button
    $button76.Text = "Ouvrir le serveur d'impression"
    $button76.Location = New-Object System.Drawing.Point(40, 210)
    $button76.Size = New-Object System.Drawing.Size(250, 30)
    $button76.Add_Click({
    printmanagement.msc
    })
    $form71.Controls.Add($button76)

#### Sortie ####

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(40, 300)
    $buttonquit.Size = New-Object System.Drawing.Size(250, 30)
    $buttonquit.Font = $boldbutton
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.Add_Click({
        $form71.Close()
    })
    $form71.Controls.Add($buttonquit)

    $form71.ShowDialog()
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

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(120, 300)
    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
    $buttonquit.Font = $boldbutton
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.Add_Click({
        $form8.Close()
    })
    $form8.Controls.Add($buttonquit)

    $form8.Add_Shown({ $form8.Activate() })
    [void]$form8.ShowDialog()
}

#### Interface principale ####

function Show-MenuForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Menu des Actions"
    $form.Size = New-Object System.Drawing.Size(300, 430)
    $form.BackColor = [System.Drawing.Color]::PowderBlue
    $form.StartPosition = "CenterScreen"

#### Creation des raccourcis ####

    $button1 = New-Object System.Windows.Forms.Button
    $button1.Text = "1) Creation raccourcis"
    $button1.Location = New-Object System.Drawing.Point(10, 10)
    $button1.Size = New-Object System.Drawing.Size(250, 30)
    $button1.Add_Click({
        makeshortcut
    })
    $form.Controls.Add($button1)

#### Menu des scan systeme ####

    $button2 = New-Object System.Windows.Forms.Button
    $button2.Text = "2) Scan systeme"
    $button2.Location = New-Object System.Drawing.Point(10, 50)
    $button2.Size = New-Object System.Drawing.Size(250, 30)
    $button2.Add_Click({
        scan
    })
    $form.Controls.Add($button2)

#### Info du poste ####

    $button3 = New-Object System.Windows.Forms.Button
    $button3.Text = "3) Information poste"
    $button3.Location = New-Object System.Drawing.Point(10, 90)
    $button3.Size = New-Object System.Drawing.Size(250, 30)
    $button3.Add_Click({
    info
    })
    $form.Controls.Add($button3)

#### Relance des app ####

    $button4 = New-Object System.Windows.Forms.Button
    $button4.Text = "4) Relancer une application"
    $button4.Location = New-Object System.Drawing.Point(10, 130)
    $button4.Size = New-Object System.Drawing.Size(250, 30)
    $button4.Add_Click({
        killapp
    })
    $form.Controls.Add($button4)

#### Obs event ####

    $button5 = New-Object System.Windows.Forms.Button
    $button5.Text = "5) Outils Windows"
    $button5.Location = New-Object System.Drawing.Point(10, 170)
    $button5.Size = New-Object System.Drawing.Size(250, 30)
    $button5.Add_Click({
    wintools
    })
    $form.Controls.Add($button5)

#### DL App ####

    $button6 = New-Object System.Windows.Forms.Button
    $button6.Text = "6) Telecharger application"
    $button6.Location = New-Object System.Drawing.Point(10, 210)
    $button6.Size = New-Object System.Drawing.Size(250, 30)
    $button6.Add_Click({
    app
    })
    $form.Controls.Add($button6)

#### Btn reboot ####

    $buttonrbt = New-Object System.Windows.Forms.Button
    $buttonrbt.Text = "Reboot"
    $buttonrbt.Location = New-Object System.Drawing.Point(200, 350)
    $buttonrbt.Size = New-Object System.Drawing.Size(60, 30)
    $buttonrbt.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
    $buttonrbt.Add_Click({
                
                $formconfirm = New-Object System.Windows.Forms.Form
                $formconfirm.Text = "Confirmation"
                $formconfirm.Size = New-Object System.Drawing.Size(300, 120)
                $formconfirm.StartPosition = "CenterScreen"

                $labelconfirm = New-Object System.Windows.Forms.Label
                $labelconfirm.Location = New-Object System.Drawing.Point(25,20)
                $labelconfirm.Size = New-Object System.Drawing.Size(300,20)
                $labelconfirm.Text = '!! Attention le poste va redemarrer !!'
                $labelconfirm.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
                $formconfirm.Controls.Add($labelconfirm)
                        
                        $okButton = New-Object System.Windows.Forms.Button
                        $okButton.Location = New-Object System.Drawing.Point(40,50)
                        $okButton.Size = New-Object System.Drawing.Size(75,23)
                        $okButton.Text = 'Reboot'
                        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                        $okButton.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
                        $okButton.ForeColor  = 'Red'
                        $formconfirm.AcceptButton = $okButton
                        $formconfirm.Controls.Add($okButton)

                        $cancelButton = New-Object System.Windows.Forms.Button
                        $cancelButton.Location = New-Object System.Drawing.Point(150,50)
                        $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                        $cancelButton.Text = 'Cancel'
                        $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                        $cancelButton.BackColor = $quitbackcolor
                        $formconfirm.CancelButton = $cancelButton
                        $formconfirm.Controls.Add($cancelButton)
                        $resultconfirm = $formconfirm.ShowDialog()

                                 if ($resultconfirm -eq [System.Windows.Forms.DialogResult]::OK)
                                    {
                                    #shutdown /r /t 0
                                    Write-Host ca redemarre
                                    }
                $formconfirm.Add_Shown({$formconfirm.Activate()})   
    })
    $form.Controls.Add($buttonrbt)

#### Sortie ####

    $buttonquit = New-Object System.Windows.Forms.Button
    $buttonquit.Text = "Quitter"
    $buttonquit.Location = New-Object System.Drawing.Point(10, 350)
    $buttonquit.Size = New-Object System.Drawing.Size(150, 30)
    $buttonquit.BackColor = $quitbackcolor
    $buttonquit.Font = $boldbutton
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