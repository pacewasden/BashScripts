#!/bin/bash

configure_firewall() {
    echo "Network Firewall Configurator"
    echo "-------------------------------"

    read -p "Enter 'allow' or 'deny' for incoming traffic: " incoming_action
    read -p "Enter 'allow' or 'deny' for outgoing traffic: " outgoing_action

    # Validate user input
    if [[ "$incoming_action" != "allow" && "$incoming_action" != "deny" ]] || [[ "$outgoing_action" != "allow" && "$outgoing_action" != "deny" ]]; then
        echo "Invalid input. Please enter 'allow' or 'deny' for incoming and outgoing traffic."
        exit 1
    fi

    # Clear existing rules
    sudo ufw --force reset

    # Set default policies
    sudo ufw default deny incoming
    sudo ufw default deny outgoing

    # Allow or deny incoming traffic based on user input
    if [ "$incoming_action" == "allow" ]; then
        echo "Allowing incoming traffic..."
        sudo ufw allow in to any
    else
        echo "Denying incoming traffic..."
    fi

    # Allow or deny outgoing traffic based on user input
    if [ "$outgoing_action" == "allow" ]; then
        echo "Allowing outgoing traffic..."
        sudo ufw allow out to any
    else
        echo "Denying outgoing traffic..."
    fi

    # Enable the firewall
    sudo ufw --force enable

    echo "Firewall configuration completed."
}

configure_firewall
