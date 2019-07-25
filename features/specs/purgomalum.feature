Feature: Be able to filtering and removing content using this API


@1 @errorMessage
Scenario: Services GET - without parameter: text (requerid)
	When send request "json" whith parameter "add=this, some&fill_text=[replaced]"
	Then response "200" should be returned
	Then the result should be error "No Input"

@2 @errorMessage
Scenario: Service GET - with parameters: text in blank
	When send request "json" whith parameter "text="
	Then response "200" should be returned
	Then the result should be error "No Input"

@3 @success
Scenario: Service GET - with parameters: text OK
	When send request "json" whith parameter "text=teste coelho purgomalum"
	Then response "200" should be returned
	Then the result should be "teste coelho purgomalum"

@4 @success
Scenario: Service GET - with parameters: "text" + "add one word
	When send request "json" whith parameter "text=teste coelho purgomalum&add=coelho"
	Then response "200" should be returned
	Then the result should be "teste ****** purgomalum"

@5 @success
Scenario: Service GET - with parameters: "text" + "add" with many word 
	When send request "json" whith parameter "text=teste coelho purgomalum&add=coelho, purgomalum"
	Then response "200" should be returned
	Then the result should be "teste ****** **********"

@6 @errorMessage
Scenario: Service GET - with parameters: "text" + "add" with many word using invalid character (;)
	When send request "json" whith parameter "text=teste coelho purgomalum&add=coelho; purgomalum"
	Then response "200" should be returned
	Then the result should be error "Invalid Characters in User Black List"

@7 @success
Scenario: Service GET - with parameters: "text" + "fill_text"
	When send request "json" whith parameter "text=teste coelho purgomalum&fill_text=[removed]"
	Then response "200" should be returned
	Then the result should be "teste coelho purgomalum"

@8 @success
Scenario: Service GET - with parameters: "text" + "fill_char"
	When send request "json" whith parameter "text=teste coelho purgomalum&fill_char=*"
	Then response "200" should be returned
	Then the result should be "teste coelho purgomalum"

@9 @errorMessage
Scenario: Service GET - with parameters: "text" + "fill_char" using invalid character
	When send request "json" whith parameter "text=teste coelho purgomalum&fill_char=X"
	Then response "200" should be returned
	Then the result should be error "Invalid User Replacement Characters"

@10 @success
Scenario: Service GET - with parameters: "text" + "add" + "fill_text"
	When send request "json" whith parameter "text=novo teste coelho purgomalum&add=coelho,novo&fill_text={PALAVRA REMOVIDA}"
	Then response "200" should be returned
	Then the result should be "{PALAVRA REMOVIDA} teste {PALAVRA REMOVIDA} purgomalum"

@11 @success
Scenario: Service GET - with parameters: "text" + "add" + "fill_char"
	When send request "json" whith parameter "text=novo teste coelho purgomalum&add=coelho,novo&fill_char=-"
	Then response "200" should be returned
	Then the result should be "---- teste ------ purgomalum"

@12 @error
Scenario: Service GET - with parameters: "text" + "add" + fill_text + "fill_char"
	When send request "json" whith parameter "text=novo teste coelho purgomalum&add=novo, teste&fill_char=*&add=coelho&fill_text={PALAVRA REMOVIDA}"
	Then response "200" should be returned
	Then the result should be "**** ***** {PALAVRA REMOVIDA} purgomalum"
	# Obs.: this request is ignoring second paremeter "add"

@13 @success
Scenario: Service GET - with parameters: "text" + "add" + "fill_text" with exactly 20 characters
	When send request "json" whith parameter "text=novo teste coelho purgomalum&add= teste&fill_text=[123456789123456789]"
	Then response "200" should be returned
	Then the result should be "novo [123456789123456789] coelho purgomalum"

@14 @errorMessage
Scenario: Service GET - with parameters: "text" + "add" + "fill_text" with more than 20 characters
	When send request "json" whith parameter "text=novo teste coelho purgomalum&add= teste&fill_text={TEXTO COM MAIS DE VINTE CARACTERES}"
	Then response "200" should be returned
	Then the result should be error "User Replacement Text Exceeds Limit of 20 Characters."

@15 @success
Scenario: Service GET - with parameters: "text" + "add" content numbers + "fill_text"
	When send request "json" whith parameter "text=1969 teste coelho purgomalum&add=1969&fill_text=[removido]"
	Then response "200" should be returned
	Then the result should be "[removido] teste coelho purgomalum"

@16 @success
Scenario: Service GET - with parameters: "text" + "add" content numbers + "fill_char"
	When send request "json" whith parameter "text=1969 teste coelho purgomalum&add=1969&fill_char=*"
	Then response "200" should be returned
	Then the result should be "**** teste coelho purgomalum"

@17 @success
Scenario: Service GET - with parameters: "text" + "fill_text" + paragrath including 347 characters
	When send request "json" whith parameter "text=Mussum Ipsum, cacilds vidis litro abertis. Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Em pe sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. Viva Forevis aptent taciti sociosqu ad litora torquent.&add=cacilds &fill_text=[removido]"
	Then response "200" should be returned
	Then the result should be "Mussum Ipsum, [removido] vidis litro abertis. Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. Em pe sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. Viva Forevis aptent taciti sociosqu ad litora torquent."

@18 @success @containsprofanity
Scenario: Service GET - with parameters: "text" + add + containsprofanity = true
	When send request "containsprofanity" whith parameter "text=1969 teste coelho purgomalum&add=1969"
	Then response "200" should be returned
	Then the result should contain "true"

@19 @success @containsprofanity
Scenario: Service GET - with parameters: "text" + add whith 2 words + containsprofanity = true
	When send request "containsprofanity" whith parameter "text=novo teste coelho purgomalum&add=1969, teste"
	Then response "200" should be returned
	Then the result should contain "true"

@20 @success @containsprofanity
Scenario: Service GET - with parameters: "text" + add + containsprofanity = false
	When send request "containsprofanity" whith parameter "text=novo teste coelho purgomalum&add=1969"
	Then response "200" should be returned
	Then the result should contain "false"