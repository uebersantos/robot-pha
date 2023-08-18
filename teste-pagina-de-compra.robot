Language: Brazilian Portuguese

*** Settings ***
Library        SeleniumLibrary
Test Setup     Abrir Navegador
Test Teardown  Fechar Navegador

*** Variables ***
${browser}        chrome
${url}            http://www.automationpractice.pl/index.php
${cmpBusca}      search_query_top  
${btnDresses}    xpath=(//*[@title="Dresses"])[last()]

*** Test Cases ***
Validar nome exibido topo pagina
    Dado que esteja na pagina
    Então deve apresentar nome corretamente  

Validar seleção de vestido
    Dado que esteja na pagina
    Quando clico no menu "Dresses"
    Então na pagina de vestidos deve apresentar vestido corretamente  

Validar busca e seleção de look
    Dado que esteja na pagina
    Quando busco o item "faded"
    E na pagina exibida seleciono item
    Então altero quantidade e tamanho


** Keywords ***

Abrir Navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Fechar Navegador
    Close Browser

que esteja na pagina
    Wait Until Element Is Visible    //img[@class="logo img-responsive"]

deve apresentar nome corretamente
    Title Should Be    My Shop

clico no menu "${menu}"
    IF    "${menu}" == "Dresses"
        Click Element    ${btnDresses}
    ELSE IF    "${menu}" == "Women"
        Click Element    //a[@title="Women"]
    ELSE IF    "${menu}" == "T-Shirts"
        Click Element    //a[@title="T-shirts"]
    ELSE IF    "${menu}" == "Women"
        Click Element    $//a[@title="Blog"]
    END

na pagina de vestidos deve apresentar vestido corretamente
    Wait Until Element Is Visible    class=category-name        10
    Mouse Over                       xpath=(//img[@title="Printed Dress"])[2]
    Capture Page Screenshot
    Sleep    3s

busco o item "${texto}"
    Input Text    //input[@name="search_query"]    ${texto}
    Press Keys    //input[@name="search_query"]    ENTER
    
na pagina exibida seleciono item
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img    10
    # Click Element    xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Click Element    xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

altero quantidade e tamanho
    Wait Until Element Is Visible    //a[contains(@class, "product_quantity_up")]
    Sleep    5s
    Click Element    //a[contains(@class, "product_quantity_up")]
    Select From List By Value    group_1    3