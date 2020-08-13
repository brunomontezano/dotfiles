import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

# Call the dracula theme function
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
