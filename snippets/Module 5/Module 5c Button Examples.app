<!-- TestCmp.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes" access="global" >

    <aura:attribute name="message" type="String" default="Click Me!" />
    <aura:attribute name="whichHTMLButton" type="String" default="" />
    <aura:attribute name="whichUIButton" type="String" default="" />
    <aura:attribute name="selectedButtonId" type="String" default="btn1" />
    <aura:attribute name="selectedButtonLabel" type="String" default="View Map" />

    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Buttons with SLDS</strong><br/>
        <span style="border:1px dashed red">
            <button class="slds-button">Click Me!</button>
        </span>
        <br/>
        <span style="border:1px dashed red">
            <a href="#scene2" class="slds-button">Click Me!</a>
        </span>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Button Groups with SLDS</strong>
        <div class="slds-button-group" role="group">
            <button class="slds-button slds-button_neutral">View Map</button>
            <button class="slds-button slds-button_neutral slds-is-selected">Walking Directions</button>
            <button class="slds-button slds-button_neutral">Driving Directions</button>
        </div>  
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Defining Neutral Buttons with SLDS</strong><br/>
        <button class="slds-button slds-button_neutral">
            Standard Neutral Button
        </button>
        &nbsp;
        <button class="slds-button slds-button_neutral slds-button_small">
            Small Neutral Button
        </button>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Defining Brand Buttons with SLDS</strong><br/>
        <button class="slds-button slds-button_brand">
            Standard Brand Button
        </button> 
        &nbsp;
        <button class="slds-button slds-button_brand slds-button_small"> 
            Small Brand Button 
        </button>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Defining Inverse Buttons with SLDS</strong>
        <div style="height: 3em; width: 380px; padding: 2px; border-bottom: 1px solid silver; background-color: MidnightBlue">
            <button class="slds-button slds-button_inverse">
                Standard Inverse Button
            </button>
            &nbsp;
            <button class="slds-button slds-button_inverse slds-button_small">
                Small Inverse Button
            </button>
        </div>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Defining Stateful Buttons with SLDS</strong><br/>
        <button class="slds-button slds-button_neutral slds-not-selected" aria-live="assertive">
            <span class="slds-text-selected">Following</span>
            <span class="slds-text-not-selected">Follow</span>
            <span class="slds-text-selected-focus">Unfollow</span>
        </button>
    </div>

    <div class="slds-box slds-size_5-of-12">
        <strong>Defining Button Group with SLDS</strong>
        <span class="slds-button-group" role="group" onclick="{!c.showButton}">
            <button value="View Map" class="slds-button slds-button_brand">View Map</button>
            <button value="Walking Directions" class="slds-button slds-button_neutral">Walking Directions</button>
            <button value="Driving Directions" class="slds-button slds-button_neutral">Driving Directions</button>
        </span>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Mutual Exclusivity Behaviour in Button Groups with SLDS</strong>
        <span class="slds-button-group" role="group" onclick="{!c.handleClick}">
            <button class="slds-button slds-button_brand">View Map</button>
            <button class="slds-button slds-button_neutral">Walking Directions</button>
            <button class="slds-button slds-button_neutral">Driving Directions</button>
        </span>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Defining SLDS Icon Buttons</strong><br/>
        <button class="slds-button slds-button_neutral">
            <lightning:icon iconName="utility:download" size="xx-small" alternativeText="Download stuff"/>
            Extra-Extra-Small
        </button>
        <button class="slds-button slds-button_neutral">
            <lightning:icon iconName="utility:download" size="x-small" alternativeText="Download stuff"/>
            Extra-Small
        </button>           
        <button class="slds-button slds-button_neutral">
            <lightning:icon iconName="utility:download" size="small" alternativeText="Download stuff"/>
            Small
        </button>
        <button class="slds-button slds-button_neutral">
            <lightning:icon iconName="utility:download" size="medium" alternativeText="Download stuff"/>
            Medium
        </button>
        <button class="slds-button slds-button_neutral">
            <lightning:icon iconName="utility:download" size="large" alternativeText="Download stuff"/>
            Large
        </button>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Handling a ui:button click</strong>
        <br/><ui:button aura:id="button" label="Click Me!" press="{!c.handleButtonClick}"/>
        <br/>message attribute. Will update when button clicked: <b>{!v.message}</b> <!-- This is automatically refreshed when data changes -->
        <br/>message attribute. Will NOT update when button clicked: <b>{#v.message}</b> <!-- This is not automatically refreshed when data changes -->
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Mutual Exclusivity Behaviour in HTML Button Groups</strong>
        <span class="slds-button-group" role="group" onclick="{!c.handleHTMLButtonGroupClick}">
            <button value="button1" class="slds-button slds-button_brand">Button 1</button>
            <button value="button2" class="slds-button slds-button_neutral">Button 2</button>
            <button value="button3" class="slds-button slds-button_neutral">Button 3</button>
        </span>      
        <div class="{!v.whichHTMLButton == '' ? 'slds-hide' : ''}">
            <br/>You clicked: <strong>{!v.whichHTMLButton}</strong>
        </div>
    </div>
    
    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Mutual Exclusivity Behaviour in ui:button Groups</strong>
        <span class="slds-button-group" role="group" >
            <ui:button aura:id="button1" label="Button 1" class="slds-button slds-button_brand" press="{!c.handleUIButtonGroupClick}" />
            <ui:button aura:id="button2" label="Button 2" class="slds-button slds-button_neutral" press="{!c.handleUIButtonGroupClick}" />
            <ui:button aura:id="button3" label="Button 3" class="slds-button slds-button_neutral" press="{!c.handleUIButtonGroupClick}" />
        </span>      
        <div class="{!v.whichUIButton == '' ? 'slds-hidden' : ''}">
            <br/>You clicked: <strong>{!v.whichUIButton}</strong>
        </div>
    </div>

    <div class="slds-box slds-size_5-of-12">
        <strong>Implementing Mutual Exclusivity Behaviour in lightning:button groups</strong>
        <lightning:buttonGroup>     
            <lightning:button variant="brand" label="View Map" onclick="{!c.myAction}" aura:Id="btn1"/>
            <lightning:button variant="neutral" label="Walking Directions" onclick="{!c.myAction}" aura:Id="btn2" />
            <lightning:button variant="neutral" label="Driving Directions" onclick="{!c.myAction}" aura:Id="btn3"/> 
        </lightning:buttonGroup>
        <br/>Currently selected button: <strong>{!v.selectedButtonLabel}</strong>
    </div>

</aura:component>

<!-- TestCmpController.js -->
({
    handleClick : function(component, event, helper) {       
        var el = event.target || event.srcElement; // Get the clicked button
        
        // Reset buttons to “neutral” state
        var allButtons = el.parentElement.children;
        for (var i=0; i<allButtons.length; i++) {
            $A.util.removeClass(allButtons[i],"slds-button_brand");
            $A.util.addClass(allButtons[i],"slds-button_neutral");    
        }
        
        // Apply brand to clicked button
        $A.util.removeClass(el,"slds-button_neutral");
        $A.util.addClass(el,"slds-button_brand");
    },
    showButton : function(component, event, helper) {
        var el = event.target || event.srcElement;
        alert("You pressed: " + el.getAttribute("value"));
    },
    handleButtonClick : function(component, event) {
        var msg = component.get("v.message");
        console.log("Value of message attribute: " + msg);
        
        var btn = component.find("button"); // Use the aura:id to find the button component
        console.log("Label of button component: " + btn.get("v.label"));
        
        var target = event.getSource(); // Use the event (i.e. the click) to find the button component
        console.log("ID of component triggering event: " + target.getLocalId());
        component.set("v.message", target.get("v.label") + " clicked");
    },
    handleHTMLButtonGroupClick : function(component, event, helper) {       
        var el = event.target || event.srcElement; // Get the clicked button

        // Reset buttons to “neutral” state
        var allButtons = el.parentElement.children;
        for (var i=0; i<allButtons.length; i++) {
            $A.util.removeClass(allButtons[i],"slds-button_brand");
            $A.util.addClass(allButtons[i],"slds-button_neutral");    
        }
        
        // Apply brand to clicked button
        $A.util.removeClass(el,"slds-button_neutral");
        $A.util.addClass(el,"slds-button_brand");
        component.set("v.whichHTMLButton", el.getAttribute("value"));
    },
    handleUIButtonGroupClick : function(component, event, helper) {
        // Reset buttons to “neutral” state
        for (var i=1; i<=3; i++) {
            var btn = component.find("button" + i);
            $A.util.removeClass(btn,"slds-button_brand");
            $A.util.addClass(btn,"slds-button_neutral");            
        }
        
        // Apply brand to clicked button
        var btn = event.getSource();
        $A.util.removeClass(btn,"slds-button_neutral");
        $A.util.addClass(btn,"slds-button_brand");
        component.set("v.whichUIButton", btn.getLocalId());
    },
    myAction : function(component, event, helper) {
        
        // Deselect currently active button by changing its theme from "brand" to neutral
        component.find(component.get('v.selectedButtonId')).set("v.variant", "neutral");
        
        // Persist id of currently selected button  
        component.set('v.selectedButtonId', event.getSource().getLocalId());
        component.set('v.selectedButtonLabel', event.getSource().get('v.label'));
        
        // Set style of currently selected button to "brand"
        component.find(component.get('v.selectedButtonId')).set("v.variant", "brand");
    }
})