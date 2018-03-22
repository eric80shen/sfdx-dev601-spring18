<!-- FriendsWithBoats.app -->
<aura:application extends="force:slds">
    
    <lightning:layout horizontalAlign="center" multipleRows="true">
        <lightning:layoutItem padding="around-small" size="8">
            <c:BoatSearch />
        </lightning:layoutItem>
        
        <lightning:layoutItem padding="around-small" size="4">
            <c:BoatDetails />
        </lightning:layoutItem>
    </lightning:layout>
    
</aura:application>