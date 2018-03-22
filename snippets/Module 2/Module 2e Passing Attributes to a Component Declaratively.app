<!-- TestApp.app -->
<aura:application access="global" extends="force:slds">
    
    <div class="slds-box slds-size_1-of-4">
        
        1 + 1 = <c:TestCmp num1="1" num2="1" />
        
    </div>
</aura:application>

<!-- TestCmp.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes" access="global" >
    
	<aura:attribute name="num1" type="Decimal" default="0"/>
	<aura:attribute name="num2" type="Decimal" default="0" />

	{!v.num1 + v.num2}
    
</aura:component>
