<!-- TestCmp.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes" access="global" >

    <div class="slds-box slds-size_1-of-2">
        <strong>Using Markup to define a ui:menu</strong><br/>
        <ui:menu >
            <ui:menuTrigger aura:id="trigger">
                <a href="#">Opportunity Status</a>
            </ui:menuTrigger>
            <ui:menuList aura:id="actionMenu">
                <ui:actionMenuItem aura:id="item1" label="Any" click="{!c.onMenuItemClick}"/>
                <ui:actionMenuItem aura:id="item2" label="Open" click="{!c.onMenuItemClick }" disabled="true"/>
                <ui:actionMenuItem aura:id="item3" label="Closed" click="{!c.onMenuItemClick }"/>
                <ui:actionMenuItem aura:id="item4" label="Closed Won" click="{!c.onMenuItemClick}"/>
            </ui:menuList>
        </ui:menu>
    </div>

    <div class="slds-box slds-size_1-of-2">
        <strong>Using SLDS to create menus</strong><br/>          
        <div class="slds-dropdown-trigger">
            Hover over me!
            <div class="slds-dropdown slds-dropdown_menu slds-dropdown_medium slds-dropdown_left">
                <div class="slds-dropdown__header">
                    <span class="slds-text-heading_label">Please Select</span>
                </div>
                <ul class="slds-dropdown__list" role="menu" onclick="{!c.myAction}">
                    <li class="slds-dropdown__item" role="menuitem option">
                        <a data-value="Option 1" class="slds-truncate">Option 1</a>
                    </li>
                    <li class="slds-dropdown__item"  role="menuitem option">
                        <a data-value="Option 2" class="slds-truncate">Option 2</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="slds-box slds-size_1-of-2">
        <strong>Using SLDS to create menus, adding a nubbin</strong><br/>
        <div class="slds-dropdown-trigger">
            Hover over me!
            <div class="slds-dropdown slds-dropdown_right slds-dropdown_nubbin-top slds-dropdown_menu">
                <ul class="slds-dropdown__list" role="menu" onclick="{!c.myAction}">
                    <li class="slds-dropdown__item" role="menuitem option">
                        <a data-value="0 Foo" class="slds-truncate">Foo</a>
                    </li>
                    <li class="slds-dropdown__item"  role="menuitem option">
                        <a data-value="1 Bar" class="slds-truncate">Bar</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="slds-box slds-size_1-of-2">
        <strong>Using SLDS to create menus with Text and Icons</strong><br/>
        <div class="slds-dropdown-trigger" >
            <button class="slds-button slds-button_icon-border-filled" >
                <lightning:icon iconName="utility:down" size="x-small" alternativeText="Indicates more underneath"/>
                <span class="slds-assistive-text">Show More</span>
            </button>
            <div class="slds-dropdown slds-dropdown_left slds-text-heading_label" onclick="{!c.myAction}">
                <ul class="dropdown__list" role="menu">
                    <li class="slds-dropdown__item">
                        <a href="javascript:void(0);" role="menuitem">
                            <p data-value="Accounts" class="slds-truncate">
                                <lightning:icon iconName="standard:account" size="x-small" alternativeText="Indicates account"/>           
                                Accounts
                            </p>
                        </a>
                    </li>
                    <li class="slds-dropdown__item">
                        <a href="javascript:void(0);" role="menuitem">
                            <p data-value="Approvals" class="slds-truncate">
                                <lightning:icon iconName="standard:approval" size="x-small" alternativeText="Indicates approval"/>    
                                Approvals
                            </p>
                        </a>
                    </li>
                    <li class="slds-dropdown__item">
                        <a href="javascript:void(0);" role="menuitem">
                            <p data-value="Leads" class="slds-truncate">
                                <lightning:icon iconName="standard:lead" size="x-small" alternativeText="Indicates lead"/> 
                                Leads
                            </p>
                        </a>
                    </li>
                    <li class="slds-dropdown__item">
                        <a href="javascript:void(0);" role="menuitem">
                            <p data-value="Opportunities" class="slds-truncate">
                                <lightning:icon iconName="standard:opportunity" size="x-small" alternativeText="Indicates opportunity"/> 
                                Opportunities
                            </p>
                        </a>
                    </li>
                    <li class="slds-dropdown__item">
                        <a href="javascript:void(0);" role="menuitem">
                            <p data-value="Products" class="slds-truncate">
                                <lightning:icon iconName="standard:product" size="x-small" alternativeText="Indicates product"/>          
                                Products
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="slds-box slds-size_1-of-2">
        <strong>Lightning menu - text</strong><br/>
        <lightning:buttonMenu alternativeText="More options" onselect="{!c.onMenuSelect }" iconName="utility:add">
            <lightning:menuItem label="Create" value="1" />
            <lightning:menuItem label="Update" value="2" />
            <lightning:menuItem label="Delete" value="3" />
        </lightning:buttonMenu>  
    </div>
    
    <!-- This Example uses the onactive event which is now deprecated -->
    <div class="slds-box slds-size_1-of-2">
        <strong>Lightning menu - text and icons</strong><br/>
        <lightning:buttonMenu alternativeText="Select Pizza Toppings" iconName="utility:add">
            <lightning:menuItem label="Tomatoes" value="1" checked="true" iconName="utility:favorite" onactive="{!c.onMenuItemActive}"/>
            <lightning:menuItem label="Onion" value="2" checked="true" iconName="utility:favorite" onactive="{!c.onMenuItemActive}"/>
            <lightning:menuItem label="Doritos" value="3" checked="false" onactive="{!c.onMenuItemActive}"/>
            <lightning:menuItem label="Buffalo Chicken" value="4" checked="false" iconName="utility:like" onactive="{!c.onMenuItemActive}"/>
            <lightning:menuItem label="Venison" value="5" checked="false" disabled="true" onactive="{!c.onMenuItemActive}"/>
        </lightning:buttonMenu>
    </div>

</aura:component>

<!-- TestCmpController.js -->
({
    onMenuItemClick: function(cmp, event) {
        // get label of selected item
        var source = event.getSource();
        var label = source.get("v.label");
        var id = source.getLocalId();
        alert("You clicked on: " + label);
    },
    myAction: function(component, event, helper) {
        // get value of selected item
        var value = event.target.getAttribute('data-value');
        alert("You clicked on: " + value);
    },
    onMenuSelect: function(controller,event,helper) {
        //var menuItem = event.detail.menuItem;
        //alert("You selected: " + menuItem.get("v.label"));
        var menuItem = event.getParam('value');
        alert("You selected: " + menuItem);
    },
    onMenuItemActive: function(controller,event,helper) {
        var menuItem = event.getSource();
        alert("You selected: " + menuItem.get("v.label"));
        if ( menuItem.get("v.checked") )
            menuItem.set("v.checked",false);
        else
            menuItem.set("v.checked",true);
    }  
})

<!-- TestCmp.css need this to make ui:menu items show correctly -->
.THIS .uiMenuList--default .uiMenuItem>a {
    height:2em;
}

.THIS .menuMargin {
    min-height: 2em;
}

.THIS .downIcon {
    fill: black !important;
}

.THIS .simonsclass:before {
    content: "Pick One ";
}